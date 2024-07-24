
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/message.dart';
import 'package:pkm_mobile/utils/app_export.dart';

class DoctorScreen extends StatelessWidget {
  final String doctorName;
  final String patients;
  final String experience;
  final String description;
  final String photoUrl;

  DoctorScreen({
    Key? key,
    required this.doctorName,
    required this.patients,
    required this.experience,
    required this.description,
    required this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Konsultasi Specialist')),
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              photoUrl != null ?
               ClipRRect(
                borderRadius: BorderRadius.circular(200.0), // Rounded corners
                child: Image.network(
                  photoUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )
              : Icon(Icons.person, size: 80), // Placeholder icon
              Text(doctorName),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Text('Patients: $patients'),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      width: 150,
                      child: Text('Experience: $experience'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Description:', textAlign: TextAlign.left),
                      Text(description),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => MessageScreen());
                },
                child: const Text('Konsultasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


