import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chat.dart'; // Import the ChatDetailScreen

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Map<String, dynamic>? user;
  Future<List<ChatItem>>? chatItems;

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
      });
    }
  }

  Future<List<ChatItem>> _fetchChatItems(String uid) async {
    final response = await http.get(Uri.parse('https://api.differentdentalumy.com/pesan.php?uid=$uid'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      
      List<ChatItem> chatItems = [];
      for (var item in data) {
        // Fetch sender name for each chat item
        final senderResponse = await http.get(Uri.parse('https://api.differentdentalumy.com/getuser.php?uid=${item['sender_uid']}'));
        String senderName = 'Unknown';

        if (senderResponse.statusCode == 200) {
          var senderData = jsonDecode(senderResponse.body);
          senderName = senderData['nama_lengkap'] ?? 'Unknown';
        }

        chatItems.add(ChatItem(
          senderUid: item['sender_uid'], // Include sender_uid
          fullName: senderName,
          lastMessage: item['last_message'],
          time: item['last_message_time'],
          chatid: item['chat_id'],
        ));
      }
      return chatItems;
    } else {
      throw Exception('Failed to load chat items');
    }
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
                  backgroundImage: AssetImage('assets/images/default_avatar.png'), // Update accordingly
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
    );
  }
}

class ChatItem {
  final String senderUid; // Added field for sender_uid
  final String fullName;
  final String lastMessage;
  final String time;
  final String chatid;

  ChatItem({
    required this.senderUid, // Initialize senderUid
    required this.fullName,
    required this.lastMessage,
    required this.time,
    required this.chatid,
  });

  factory ChatItem.fromJson(Map<String, dynamic> json) {
    return ChatItem(
      senderUid: json['sender_uid'] ?? 'Unknown', // Include sender_uid
      fullName: json['sender_name'] ?? 'Unknown', // Adjust based on the PHP response
      lastMessage: json['last_message'],
      time: json['last_message_time'],
      chatid: json['chat_id'],
    );
  }
}
