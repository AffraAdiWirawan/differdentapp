import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/beranda_main.dart';
import 'package:pkm_mobile/pages/forgetpass.dart';
import 'package:pkm_mobile/pages/register.dart';
import 'package:pkm_mobile/utils/app_export.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _pass;
  bool _passwordVisible = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final response = await http.post(
        Uri.parse('http://loginregister.masjidbaitulhikmah.com/check.php'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'username': _username,
          'password': _pass,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['success']) {
          // Login successful, navigate to home screen
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          // Invalid username or password
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(jsonData['message'])),
          );
        }
      } else {
        // Error occurred
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error occurred')),
        );
      }
    }
  }

  Widget _buildHeaderRow(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 46.0), // Adjust this as necessary
      padding: EdgeInsets.symmetric(horizontal: 8.0), // Adjust this as necessary
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image.asset('assets/images/logodifferdent.png'), // Correct asset path
          //(width: 22.0), // Adjust this as necessary
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "DIFFER",
                  style: CustomTextStyles.headlineLargeBold_1,
                ),
                TextSpan(
                  text: "DENT",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 28.0, // Adjust this as necessary
                vertical: 36.0, // Adjust this as necessary
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _buildHeaderRow(context), // Add this line to show the header
                    Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Username';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _username = value ?? '';
                                },
                              ),
                            ),
                            TextFormField(
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Masukan Password';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _pass = value ?? '';
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(forgetpassword());
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                            color: Colors.blueAccent[900], // Warna teks biru
                            decoration: TextDecoration.underline, // Garis bawah teks
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          // Perform login action with _nummail and _pass
                          Get.to(const BerandaMain());
                        }
                      },
                      child: const Text('Login'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            'Tidak punya akun? ',
                            style: CustomTextStyles.bodyMediumBlack900,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(Register());
                            },
                            child: Text(
                              "Daftar Sekarang",
                              style: CustomTextStyles.bodyLargeSansationCyan400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0, // Adjust this as necessary
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Atau Login Dengan",
                              style: CustomTextStyles.bodyMediumBlack900Light_1,
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(ImageConstant.logogoogle)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
