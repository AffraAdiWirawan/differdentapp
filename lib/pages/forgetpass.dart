import 'package:flutter/material.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';

// ignore: camel_case_types
class forgetpassword extends StatelessWidget {
  const forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forget Password'), automaticallyImplyLeading: false,),
      body: const Center(child: Text('Halaman Forget Password')),
    );
  }
}