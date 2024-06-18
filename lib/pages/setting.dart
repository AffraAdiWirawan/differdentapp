import 'package:flutter/material.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), automaticallyImplyLeading: false,),
      body: const Center(child: Text('Settings Screen')),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}