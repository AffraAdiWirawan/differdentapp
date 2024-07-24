import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart'; // Pastikan path import sesuai dengan struktur proyek Anda


class Augmented extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Augmented Reality', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: const ModelViewer(
        src: 'assets/ar/tooth.glb',
        ar: true,
      ),
    );
  }
}
