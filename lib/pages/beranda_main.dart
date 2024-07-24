import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/augmented.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';
import 'package:pkm_mobile/pages/konsultasi.dart';
import 'package:pkm_mobile/utils/app_export.dart';
import 'package:pkm_mobile/utils/image_constant.dart';
import 'package:pkm_mobile/pages/calender.dart';
import 'package:pkm_mobile/pages/chatai.dart';
import 'package:pkm_mobile/pages/message.dart';
import 'package:pkm_mobile/pages/setting.dart';
import 'package:pkm_mobile/pages/edukasi.dart';
import 'package:pkm_mobile/pages/rumahsakit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class BerandaMain extends StatefulWidget {
  const BerandaMain({super.key});

  @override
  State<BerandaMain> createState() => BerandaMainPage();
}

class BerandaMainPage extends State<BerandaMain> {
  final BottomNavController bottomNavController = Get.put(BottomNavController());
  Map<String, dynamic>? user;
  List<dynamic> doctors = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _fetchDoctors();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');
    if (userData != null) {
      setState(() {
        user = jsonDecode(userData);
        print('User data: $user');
      });
    }
  }

  Future<void> _fetchDoctors() async {
    final response = await http.get(Uri.parse('http://api.differentdentalumy.com/getdokter.php?role=dokter'));

    if (response.statusCode == 200) {
      setState(() {
        doctors = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      Image.asset(ImageConstant.motivasi1),
      Image.asset(ImageConstant.motivasi2),
      Image.asset(ImageConstant.banner1),
    ];

    String username = user?['username'] ?? 'User';

    final CarouselOptions options = CarouselOptions(
      height: 180.0,
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      viewportFraction: 0.8,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "DIFFER",
                style: CustomTextStyles.headlineLargeBold_1,
              ),
              TextSpan(
                text: "DENT",
                style: theme.textTheme.headlineLarge,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pengaturan akun')));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: const Text('NEWS', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          FlutterCarousel(
            items: items,
            options: options,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.up,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(Augmented());
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Image.asset(ImageConstant.iconar),
                        const Text('Augmented', textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(CalendarScreen());
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Image.asset(ImageConstant.iconkalender),
                        const Text('Kalender', textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(EdukasiScreen());
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Image.asset(ImageConstant.iconedukasi),
                        const Text('Edukasi', textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(RumahsakitScreen());
                  },
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Image.asset(ImageConstant.iconrumahsakit),
                        const Text('Rumah', textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(2.0),
            child: Text(
              'Konsultasi Spesialis',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      width: 160, // Adjust width of doctor card
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Display doctor's photo from URL
                            doctor['photo'] != null
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0), // Rounded corners
                                  child: Image.network(
                                    doctor['photo'],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Icon(Icons.person, size: 80), // Placeholder icon
                            SizedBox(height: 8.0),
                            Text(
                              doctor['nama_lengkap'] ?? 'Nama Dokter',
                              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              doctor['Spesialis'] ?? 'Spesialis',
                              style: const TextStyle(fontSize: 8),
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Navigasi ke layar dokter
                                Get.to(DoctorScreen(
                                  doctorName: doctor['nama_lengkap'] ?? 'Nama Dokter',
                                  patients: doctor['jumlahpasien']?.toString() ?? 'N/A',
                                  experience: doctor['experience']?.toString() ?? 'N/A',
                                  description: doctor['deskripsi'] ?? 'N/A',
                                  photoUrl: doctor['photo'] ?? '',
                                )); // Adjust as needed
                              },
                              child: const Text('Chat Sekarang', style: TextStyle(fontSize: 10)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offAll(() => const BerandaMain());
        break;
      case 1:
        Get.to(() => CalendarScreen());
        break;
      case 2:
        Get.to(() => ChatAIScreen());
        break;
      case 3:
        Get.to(() => MessageScreen());
        break;
      case 4:
        Get.to(() => SettingsScreen());
        break;
      case 5:
        Get.to(() => EdukasiScreen());
        break;
      case 6:
        Get.to(() => RumahsakitScreen());
        break;
    }
  }
}
