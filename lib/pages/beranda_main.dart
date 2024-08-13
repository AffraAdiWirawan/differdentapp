import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/augmented.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';
import 'package:pkm_mobile/pages/konsultasi.dart';
import 'package:pkm_mobile/pages/profile.dart';
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
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:pkm_mobile/pages/component/tutorial.dart';

class BerandaMain extends StatefulWidget {
  const BerandaMain({super.key});

  @override
  State<BerandaMain> createState() => BerandaMainPage();
}

class BerandaMainPage extends State<BerandaMain> {
  final BottomNavController bottomNavController = Get.put(BottomNavController());
  Map<String, dynamic>? user;
  List<dynamic> doctors = [];
  GlobalKey chatAI = GlobalKey();
  GlobalKey aug = GlobalKey();
  GlobalKey cal = GlobalKey();
  GlobalKey edu = GlobalKey();
  GlobalKey hos = GlobalKey();
  GlobalKey chat = GlobalKey();
  List<TargetFocus> targets1 = [];

  @override
  void initState() {
    _loadUserData();
    _fetchDoctors();
    Future.delayed(Duration(seconds: 1), () {
      showTutorial();
    });
    super.initState();
  }
  void showTutorial() {
    _initTarget();
    TutorialCoachMark tutorial = TutorialCoachMark(
      targets: targets1,
      hideSkip: true,
    )..show(context:context);
  }
  void _initTarget() {
    targets1 = [
      TargetFocus(
        identify: "Augmented",
        shape: ShapeLightFocus.Circle,
        keyTarget: aug,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text: "Augmented untuk melihat 3d Object",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: "Calender",
        shape: ShapeLightFocus.Circle,
        keyTarget: cal,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text: "Calender, mencari dan mencatat tanggal",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: "Edukasi",
        shape: ShapeLightFocus.Circle,
        keyTarget: edu,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text: "Edukasi, fitur untuk Belajar mengenai banyak hal",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: "Hospital",
        keyTarget: hos,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text: "Hospital, mengecek informasi mengenai rumah sakit",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ],
      ),
      TargetFocus(
        identify: "Chat",
        keyTarget: chat,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text: "Chat untuk berkonsultasi dengan tenaga profesional",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
                isLast: true,
              );
            },
          ),
        ],
      ),
    ];
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
      Image.asset(ImageConstant.banner2),
      Image.asset(ImageConstant.banner3),
      Image.asset(ImageConstant.banner4),
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
              bottomNavController.onItemTapped(4);
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
                    key: aug,
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
                    bottomNavController.onItemTapped(1);
                  },
                  child: SizedBox(
                    key: cal,
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
                    key: edu,
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
                    key: hos,
                    width: 80,
                    child: Column(
                      children: [
                        Image.asset(ImageConstant.iconrumahsakit),
                        const Text('Hospital', textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            key: chat,
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
      bottomNavigationBar: 
      BottomNavBar(),
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
        Get.to(() => ProfilePage());
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

