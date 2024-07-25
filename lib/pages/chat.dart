import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatDetailScreen extends StatefulWidget {
  final String pengirim;
  final String chatroom;
  ChatDetailScreen({required this.pengirim, required this.chatroom});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();
  late String userId;
  String senderName = 'Unknown';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');
    final senderResponse = await http.get(Uri.parse('https://api.differentdentalumy.com/getuser.php?uid=${widget.pengirim}'));
        

        if (senderResponse.statusCode == 200) {
          var senderData = jsonDecode(senderResponse.body);
          senderName = senderData['nama_lengkap'] ?? 'Unknown';
        }
    if (userData != null) {
      var user = jsonDecode(userData);
      userId = user['uid'];
      _fetchChatItems(userId);
    }
  }
  

  Future<void> _fetchChatItems(String uid) async {
    String chatid = widget.chatroom;
    final response = await http.get(Uri.parse('https://api.differentdentalumy.com/getdaftarpesanchatid.php?uid=$uid&chat_id=$chatid'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        messages.clear();
        for (var item in data) {
          messages.add(Message(
            text: item['last_message'],
            isSentByMe: item['sender_uid'] == uid,
          ));
        }
      });
    } else {
      // Handle error
      print('Failed to load chat items: ${response.statusCode}');
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      final messageText = _controller.text;
      setState(() {
        messages.add(Message(text: messageText, isSentByMe: true));
        _controller.clear();
      });

      final response = await http.post(
        Uri.parse('https://api.differentdentalumy.com/pesanbaru.php'),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'sender_uid': userId,
          'receiver_uid': widget.pengirim,
          'message_text': messageText,
          'chat_id': widget.chatroom,
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['error'] != null) {
          // Handle error from server
          print('Error from server: ${responseData['error']}');
        } else {
          // Message sent successfully
          _fetchChatItems(userId); // Refresh chat items to include the new message
        }
      } else {
        // Handle HTTP error
        print('Failed to send message. Status code: ${response.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(senderName),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: message.isSentByMe ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(message.text),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSentByMe;

  Message({required this.text, required this.isSentByMe});
}
