import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/beranda_main.dart';
import 'package:pkm_mobile/pages/forgetpass.dart';
import 'package:pkm_mobile/pages/register.dart';
import 'package:pkm_mobile/utils/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:pkm_mobile/pages/component/tutorial.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _pass;
  bool _passwordVisible = false;
  List<TargetFocus> targets1 = [];
  GlobalKey reg = GlobalKey();
  GlobalKey log = GlobalKey();
  GlobalKey isidata = GlobalKey();
  @override
  void initState () {
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
        shape: ShapeLightFocus.RRect,
        identify: "Register",
        keyTarget: reg,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text: "Registrasi untuk memasuki aplikasi",
                onNext: () {
                  controller.next();
                },
                onSkip: () {
                  controller.skip();
                },
              );
            },
          ),
        ]
      ),
      TargetFocus(
        identify: "isi",
        shape: ShapeLightFocus.RRect,
        keyTarget: isidata,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text: "Masukan Username dan Password anda",
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
        identify: "Button",
        keyTarget: log,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CoachmarkDesc(
                text: "Klik Login setelah memasukan Username dan password",
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


  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final requestBody = jsonEncode(<String, String>{
        'username': _username,
        'password': _pass,
      });

      // Print the request body for debugging
      print('Request body: $requestBody');

      // Make the HTTP POST request
      final response = await http.post(
        Uri.parse('https://api.differentdentalumy.com/login.php'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: requestBody,
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        
        // Simpan data pengguna ke SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(responseBody['user']));

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BerandaMain()),
        );
      } else {
        print(23);
        // Show a SnackBar with the error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username atau password salah')),
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
          RichText(
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      key: isidata,
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
                    key: log,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        _login();
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
                          key: reg,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
