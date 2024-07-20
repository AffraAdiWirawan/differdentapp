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
        print('User data: $user');
        chatItems = _fetchChatItems(user!['uid']);
      });
    }
  }

  Future<List<ChatItem>> _fetchChatItems(String uid) async {
    final response = await http.get(Uri.parse('https://api.differentdentalumy.com/pesan.php?uid=$uid'));

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ChatItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load chats');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Konsultasi'),
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
                  // Placeholder or default image if you have one
                  backgroundImage: AssetImage('assets/images/default_avatar.png'), // Update accordingly
                ),
                title: Text(chatItem.name),
                subtitle: Text(chatItem.lastMessage),
                trailing: Text(chatItem.time),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailScreen(name: chatItem.name),
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
  final String name;
  final String lastMessage;
  final String time;

  ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
  });

  factory ChatItem.fromJson(Map<String, dynamic> json) {
    return ChatItem(
      name: json['sender_uid'] == '' ? json['receiver_uid'] : json['sender_uid'], // Assuming sender_uid is used to display the name
      lastMessage: json['last_message'],
      time: json['last_message_time'],
    );
  }
}
