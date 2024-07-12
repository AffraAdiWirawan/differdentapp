import 'package:flutter/material.dart';


class RumahsakitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rumah Sakit'),
        automaticallyImplyLeading: true, // Menampilkan tombol kembali secara otomatis
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _buildRumahSakitCard(
            'assets/images/images.jpeg', // Gambar rumah sakit (ganti dengan path gambar yang sesuai)
            'RS AMC Muhammadiyah Yogyakarta', // Nama rumah sakit
            'Senin - Sabtu: 09.00 - 19.00', // Jam buka
            'Jl. HOS Cokroaminoto No.17B, Pakuncen, Wirobrajan, Kota Yogyakarta, Daerah Istimewa Yogyakarta 55253',
            'https://maps.app.goo.gl/xvrkWKtvGUHASk2k9', // Alamat rumah sakit
          ),
        ],
      ),
    );
  }

  Widget _buildRumahSakitCard(String imagePath, String nama, String jamBuka, String alamat, String Maps) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nama,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Jam Buka:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  jamBuka,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Alamat:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  alamat,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Google Maps:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  Maps,
                  style: TextStyle(
                    fontSize: 16.0,
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
