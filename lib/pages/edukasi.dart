import 'package:flutter/material.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart'; // Pastikan path import sesuai dengan struktur proyek Anda

class EdukasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edukasi'),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          // Horizontal list of video boxes
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                VideoBox(),
                VideoBox(),
                VideoBox(),
                VideoBox(),
              ],
            ),
          ),
          // Vertical list of PDF module boxes
          Expanded(
            child: ListView(
              children: <Widget>[
                PdfModuleBox(),
                PdfModuleBox(),
                PdfModuleBox(),
                PdfModuleBox(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class VideoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300], // Warna latar belakang sementara
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 9, // Mengatur rasio aspek video (misalnya 16:9)
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/video_thumbnail.jpg'), // Gambar preview video
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Judul Video',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),
                Text(
                  'Nama Channel',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PdfModuleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 68, 152, 195), // Warna latar belakang
        borderRadius: BorderRadius.circular(8.0), // Sudut bulatan
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // Posisi bayangan
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white, // Warna latar belakang untuk ikon
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            child: Icon(
              Icons.picture_as_pdf,
              size: 40.0,
              color: Color.fromARGB(255, 68, 152, 195), // Warna ikon
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Nama Modul Edukasi',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Deskripsi singkat tentang modul ini.',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
