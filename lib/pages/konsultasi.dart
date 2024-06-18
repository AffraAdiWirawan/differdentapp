
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/message.dart';
import 'package:pkm_mobile/utils/app_export.dart';

class DoctorScreen extends StatelessWidget { 
  DoctorScreen({super.key});
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  Widget build (BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Konsultasi Specialist'),),
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Image.asset(ImageConstant.usericon),
              const Text('Nama Dokter'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: const Text('Patients'),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 150,
                      child: const Text('Experinece'),
                    )
                  ]
                ),
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Description', textAlign: TextAlign.left,),
                    Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna. Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci. Aenean nec lorem. In porttitor. Donec laoreet nonummy augue. Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.')
                  ],
                ),
              ),
              ElevatedButton(
               onPressed: () {
                // Perform login action with _nummail and _pass
                Get.to(MessageScreen());
              },
                child: const Text('Konsultasi'),
              ),
            ]
          ),
        ) 
      )
    );
  }
}