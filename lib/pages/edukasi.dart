import 'package:flutter/material.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart'; // Pastikan path import sesuai dengan struktur proyek Anda
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EdukasiScreen(),
    );
  }
}

class EdukasiScreen extends StatelessWidget {
  final List<Map<String, String>> pdfModules = [
    {
      'title': 'Modul Edukasi 1',
      'description': 'Kesehatan Gigi Pada Anak Berkebutuhan Khusus.',
      'pdfUrl': 'https://docs.google.com/document/d/10lTZrImjccSuF7YVaFkFTcxrTAUWlNKp/edit?usp=sharing&ouid=117605629388352350290&rtpof=true&sd=true',
    },
    {
      'title': 'Modul Edukasi 2',
      'description': 'Perawatan Gigi Anak Berkebutuhan Khusus.',
      'pdfUrl': 'https://drive.google.com/file/d/1FDCT562RVfRuSUkIM8mlsuwAJQoEcotu/view?usp=sharing',
    },
    {
      'title': 'Modul Edukasi 3',
      'description': 'Mengenal Anak Berkebutuhan Khusus.',
      'pdfUrl': 'https://drive.google.com/file/d/1i8NrT2_PiRUsbsMEN6aKF92FcTy_9Un4/view?usp=sharing',
    },
    // Tambahkan lebih banyak modul sesuai kebutuhan
  ];

  final List<Map<String, String>> videoModules = [
    {
      'title': 'Video Edukasi 1',
      'channel': 'DifferenDental',
      'thumbnail': 'assets/images/konten3.png',
      'videoUrl': 'https://youtu.be/ulcR5-P5qfw?si=8yUkYIIWCqnCJRCl',
    },
    {
      'title': 'Video Edukasi 2',
      'channel': 'DifferenDental',
      'thumbnail': 'assets/images/konten1.png',
      'videoUrl': 'https://youtube.com/shorts/iM9MqfHAC5w?si=eQUcEiJNWbQMq1nf',
    }, 
    {
      'title': 'Video Edukasi 3',
      'channel': 'DifferenDental',
      'thumbnail': 'assets/images/konten2.png',
      'videoUrl': 'https://youtube.com/shorts/fekaH0T8dGE?si=Pdnu7RSiMq9emUMq',
    },
    // Tambahkan lebih banyak video sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edukasi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          // Horizontal list of video boxes
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videoModules.length,
              itemBuilder: (context, index) {
                return VideoBox(
                  title: videoModules[index]['title']!,
                  channel: videoModules[index]['channel']!,
                  thumbnail: videoModules[index]['thumbnail']!,
                  videoUrl: videoModules[index]['videoUrl']!,
                );
              },
            ),
          ),
          // Vertical list of PDF module boxes
          Expanded(
            child: ListView.builder(
              itemCount: pdfModules.length,
              itemBuilder: (context, index) {
                return PdfModuleBox(
                  title: pdfModules[index]['title']!,
                  description: pdfModules[index]['description']!,
                  pdfUrl: pdfModules[index]['pdfUrl']!,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class VideoBox extends StatelessWidget {
  final String title;
  final String channel;
  final String thumbnail;
  final String videoUrl;

  VideoBox({required this.title, required this.channel, required this.thumbnail, required this.videoUrl});

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
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
            ),
          );
        },
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
                    image: AssetImage(thumbnail), // Gambar preview video
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
                    title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    channel,
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
      ),
    );
  }
}

class PdfModuleBox extends StatelessWidget {
  final String title;
  final String description;
  final String pdfUrl;

  PdfModuleBox({required this.title, required this.description, required this.pdfUrl});

  void _launchURL() async {
    if (await canLaunch(pdfUrl)) {
      await launch(pdfUrl);
    } else {
      throw 'Could not launch $pdfUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
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
                      title,
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
                      description,
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
      ),
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    String videoId = YoutubePlayer.convertUrlToId(videoUrl)!;
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
