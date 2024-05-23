import 'package:flutter/material.dart';
import 'package:pkm_mobile/registration_form.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome"),
            Image(
              image: AssetImage("assets/icons/differdent.jpg"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationForm()));
    }
    );
    super.initState();
  }
}
