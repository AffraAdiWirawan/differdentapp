import 'package:flutter/material.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message'), automaticallyImplyLeading: false,),
      body: const Center(child: Text('Message Screen')),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}