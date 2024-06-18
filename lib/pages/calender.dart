import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';
import 'package:pkm_mobile/pages/pengingat.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar'), automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(Pengingat());
              },
              child: const Text('Pengingat'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}