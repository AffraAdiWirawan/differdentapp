import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State <Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome"),
            SizedBox(height: 20), // Tambahkan jarak antara teks dan gambar
            ImageIcon(AssetImage("web/icons/differdent.jpg")),
          ],
          ),
      ),
    );
  }
}