import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pkm_mobile/consts.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';

class  ChatAIScreen extends StatefulWidget {
  const ChatAIScreen({super.key});
  @override
  State<ChatAIScreen> createState() => _MainPageState();
}

class _MainPageState extends State<ChatAIScreen> {
  TextEditingController textEditingController = TextEditingController();
  String answer = '';
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text('ChatAI'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan Keluhan Anda',
                  )
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                 GenerativeModel model = GenerativeModel(
                    model: 'gemini-1.5-flash-latest', apiKey: apiKey);
                    model.generateContent([
                      Content.text(textEditingController.text),
                    ]).then((value){
                      setState(() {
                        answer = value.text.toString();
                    });
                  });
                },
                child: const Text('Kirim'),
              ),
              const SizedBox(height: 20),
              Text(answer),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      );
  }
}
