import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/beranda_main.dart';
import 'package:pkm_mobile/utils/app_export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _nummail = '';
  String _pass = '';
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
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
                horizontal: 28.h,
                vertical: 336.v,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Phone Number/Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukan Nomor atau Email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _nummail = value ?? '';
                      },
                    ),
                    TextFormField(
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                    GestureDetector(
                      onTap: () {
                        // Implementasi lupa password di sini
                        print('Forget Password tapped');
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
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Tidak punya akun? ',
                              style: CustomTextStyles.bodyMediumBlack900
                            ),
                            TextSpan(
                              text: "Daftar Sekarang",
                              style: CustomTextStyles.bodyLargeSansationCyan400
                            )
                          ]
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(child: Divider()),
                          Text(
                            "Atau Login Dengan",
                            style: CustomTextStyles.bodyMediumBlack900Light_1,  
                          ),
                          const Expanded(child: Divider())
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
                    )
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
