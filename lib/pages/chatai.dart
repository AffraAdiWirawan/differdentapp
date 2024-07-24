import 'package:flutter/material.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';

class ChatAIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChatAI',
      style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,
        ),
      body: const Center(child: Text('ChatAI Screen')),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}