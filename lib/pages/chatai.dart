import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pkm_mobile/consts.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';

class ChatAIScreen extends StatefulWidget {
  const ChatAIScreen({super.key});
  @override
  State<ChatAIScreen> createState() => _MainPageState();
}

class _MainPageState extends State<ChatAIScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<Map<String, String>> chatMessages = []; // Store messages and answers

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('ChatAI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                final message = chatMessages[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChatBubble(
                      text: message['user']!,
                      isUser: true,
                    ),
                    const SizedBox(height: 10),
                    ChatBubble(
                      text: message['ai']!,
                      isUser: false,
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Keluhan Anda',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    final userText = textEditingController.text;
                    textEditingController.clear();
                    chatMessages.add({'user': userText, 'ai': ''});
                    setState(() {});

                    GenerativeModel model = GenerativeModel(
                      model: 'gemini-1.5-flash-latest',
                      apiKey: apiKey,
                    );
                    model.generateContent([
                      Content.text(userText),
                    ]).then((value) {
                      setState(() {
                        chatMessages.last['ai'] = value.text.toString();
                      });
                    });
                  },
                  child: const Text('Kirim'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:BottomNavBar(),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatBubble({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(color: isUser ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
