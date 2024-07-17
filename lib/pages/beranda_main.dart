import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
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

class BerandaMain extends StatefulWidget {
  const BerandaMain({super.key});

  @override
  State<BerandaMain> createState() => BerandaMainPage();
}

class BerandaMainPage extends State<BerandaMain> {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      Image.asset(ImageConstant.motivasi1),
      Image.asset(ImageConstant.motivasi2),
      Image.asset(ImageConstant.banner1),
    ];

    final CarouselOptions options = CarouselOptions(
      height: 200.0,
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
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection: VerticalDirection.up,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to('/');
                  },
                  child: 
                    SizedBox(
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
                  child: 
                    SizedBox(
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
                  child: 
                  SizedBox(
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
                  child: 
                    SizedBox(
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Konsultasi Spesialis',
             style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
         Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      width: 160, // Mengubah lebar card dokter
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset(ImageConstant.usericon),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Nama Dokter $index',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Spesialis $index',
                              style: const TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                // Navigasi ke layar dokter
                                Get.to(DoctorScreen());
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
      case 7:
        Get.to(() =>  DoctorScreen());
        break;
    }
  }
}
