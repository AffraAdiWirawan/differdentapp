import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pkm_mobile/pages/chat.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Map<String, dynamic>? user;
  Future<List<ChatItem>>? chatItems;
  List<dynamic> doctors = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');
    if (userData != null) {
      setState(() {
        user = jsonDecode(userData);
        chatItems = _fetchChatItems(user!['uid']);
        print('User data loaded successfully');
      });
    }
    final response = await http.get(Uri.parse('http://api.differentdentalumy.com/getdokter.php?role=dokter'));

    if (response.statusCode == 200) {
      setState(() {
        doctors = jsonDecode(response.body);
        print('Doctors data loaded successfully');
      });
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  Future<List<ChatItem>> _fetchChatItems(String uid) async {
    final response = await http.get(Uri.parse('https://api.differentdentalumy.com/pesan.php?uid=$uid'));
    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      
      List<ChatItem> chatItems = [];
      for (var item in data) {
        // Fetch sender name for each chat item
        final senderResponse = await http.get(Uri.parse('https://api.differentdentalumy.com/getuser.php?uid=${item['uiddokter']}'));
        String senderName = 'Unknown';

        print(senderResponse.statusCode);
        print(senderResponse.body);

        if (senderResponse.statusCode == 200) {
          var senderData = jsonDecode(senderResponse.body);
          senderName = senderData['nama_lengkap'] ?? 'Unknown';
        }

        chatItems.add(ChatItem(
          senderUid: item['uiddokter'].toString(),
          fullName: senderName,
          lastMessage: item['last_message'],
          time: item['last_message_time'],
          chatid: item['chat_id'].toString(),
        ));
      }
      return chatItems;
    } else {
      throw Exception('Failed to load chat items');
    }
  }

  Future<String> _getOrCreateChatRoom(String uidDokter, String uidUser) async {
    print('Fetching or creating chat room...');
    print(uidDokter);
    print(uidUser);

    // Ensure the inputs are converted to integers
    final intUidDokter = int.tryParse(uidDokter);
    final intUidUser = int.tryParse(uidUser);

    if (intUidDokter == null || intUidUser == null) {
      throw Exception('Invalid UID values');
    }

    final response = await http.get(Uri.parse('https://api.differentdentalumy.com/newchatroom.php?uid_dokter=$intUidDokter&uid_user=$intUidUser'));
    print(response.statusCode);
    print(response.body);
    final data = jsonDecode(response.body);
    print('Chat room fetched/created successfully');
    return data['chat_id'].toString();
  }

  void _showDoctors() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return ListTile(
                title: Text(doctor['nama_lengkap'] ?? 'Unknown'),
                subtitle: Text('Specialization: ${doctor['Spesialis'] ?? 'No specialization'}'),
                onTap: () async {
                  try {
                    final chatId = await _getOrCreateChatRoom(doctor['uid'].toString(), user!['uid'].toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(pengirim: doctor['uid'].toString(), chatroom: chatId),
                      ),
                    );
                  } catch (e) {
                    print('Error: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to create chat room')),
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Konsultasi', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<ChatItem>>(
        future: chatItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final chatItems = snapshot.data ?? [];

          return ListView.builder(
            itemCount: chatItems.length,
            itemBuilder: (context, index) {
              final chatItem = chatItems[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/default_avatar.png'),
                ),
                title: Text(chatItem.fullName),
                subtitle: Text(chatItem.lastMessage),
                trailing: Text(chatItem.time),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailScreen(pengirim: chatItem.senderUid, chatroom: chatItem.chatid),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDoctors,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        tooltip: 'Show Doctors',
      ),
    );
  }
}

class ChatItem {
  final String senderUid;
  final String fullName;
  final String lastMessage;
  final String time;
  final String chatid;

  ChatItem({
    required this.senderUid,
    required this.fullName,
    required this.lastMessage,
    required this.time,
    required this.chatid,
  });

  factory ChatItem.fromJson(Map<String, dynamic> json) {
    return ChatItem(
      senderUid: json['sender_uid'] ?? 'Unknown',
      fullName: json['sender_name'] ?? 'Unknown',
      lastMessage: json['last_message'],
      time: json['last_message_time'],
      chatid: json['chat_id'].toString(),
    );
  }
}
