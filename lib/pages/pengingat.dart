import 'package:flutter/material.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';

class Pengingat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengingat'), automaticallyImplyLeading: false,),
      body: const Center(child: Text('Halaman Pengingat')),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}