import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';
import 'package:pkm_mobile/pages/login_page.dart';
import 'package:pkm_mobile/pages/pengingat.dart';
import 'package:table_calendar/table_calendar.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrasi Akun')),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: SizedBox (
            width: 300,
            child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'NIK'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan Nomor atau Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan Nomor atau Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan Nomor atau Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Username'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan Nomor atau Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan Nomor atau Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Confirm Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan Nomor atau Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const LoginPage());
                      },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              )
          )
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}