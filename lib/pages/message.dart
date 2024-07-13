import 'package:flutter/material.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';
import 'chat.dart'; // Import the ChatDetailScreen

class MessageScreen extends StatelessWidget {
  final List<ChatItem> chatItems = [
    ChatItem(
      name: 'John Doe',
      lastMessage: 'Hey, how are you?',
      time: '10:30 AM',
      avatarUrl: 'assets/images/avatar1.png', // Replace with appropriate path
    ),
    ChatItem(
      name: 'Jane Smith',
      lastMessage: 'Let\'s meet tomorrow.',
      time: '09:15 AM',
      avatarUrl: 'assets/images/avatar2.png', // Replace with appropriate path
    ),
    // Add more ChatItem instances as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Konsultasi'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: chatItems.length,
        itemBuilder: (context, index) {
          final chatItem = chatItems[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chatItem.avatarUrl),
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
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class ChatItem {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;

  ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
  });
}
