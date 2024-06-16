import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/utils/app_export.dart';
import 'package:pkm_mobile/utils/image_constant.dart';

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
      Image.asset(ImageConstant.logogoogle),
      Image.asset(ImageConstant.logodifferdent),
      Image.asset(ImageConstant.logodifferdent),
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
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: const Text('NEWS'),
          ),
          FlutterCarousel(
            items: items,
            options: options,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(ImageConstant.iconar),
              const SizedBox(width: 20),
              Image.asset(ImageConstant.iconkalender),
              const SizedBox(width: 20),
              Image.asset(ImageConstant.iconedukasi),
              const SizedBox(width: 20),
              Image.asset(ImageConstant.iconrumahsakit),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
          )
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          unselectedItemColor: Colors.grey[800],
          selectedItemColor: Colors.blue[800],
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.onItemTapped,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: const Icon(Icons.home),
              backgroundColor: Colors.grey[300],
            ),
            BottomNavigationBarItem(
              label: 'Calendar',
              icon: const Icon(Icons.calendar_month_outlined),
              backgroundColor: Colors.grey[300],
            ),
            BottomNavigationBarItem(
              label: 'ChatAI',
              icon: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(ImageConstant.chatai),
              ),
              backgroundColor: Colors.grey[300],
            ),
            BottomNavigationBarItem(
              label: 'Pesan',
              icon: const Icon(Icons.message),
              backgroundColor: Colors.grey[300],
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: const Icon(Icons.settings),
              backgroundColor: Colors.grey[300],
            ),
          ],
        );
      }),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Home Screen')),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: const Center(child: Text('Calendar Screen')),
    );
  }
}

class ChatAIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ChatAI')),
      body: const Center(child: Text('ChatAI Screen')),
    );
  }
}

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Message')),
      body: const Center(child: Text('Message Screen')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Screen')),
    );
  }
}

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.to(() => HomeScreen());
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
    }
  }
}
