import 'package:flutter/material.dart';

class UjicobaPage extends StatelessWidget {
  const UjicobaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Ujicoba'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ini adalah halaman ujicoba.',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Icon(
              Icons.check_circle,
              size: 80.0,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
