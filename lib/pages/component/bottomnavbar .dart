import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/beranda_main.dart';
import 'package:pkm_mobile/utils/image_constant.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
    });
  }
}
