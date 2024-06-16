import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/login_page.dart';
import '../utils/app_export.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({super.key});

  @override
  _OpenScreenState createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(const LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 28.h,
              vertical: 336.v,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildHeaderRow(context)],
            ),
          ),
        ),
      ),
    );
  }
}

/// Section Widget
Widget _buildHeaderRow(BuildContext context) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(bottom: 46.v),
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageConstant.logodifferdent),
          SizedBox(width: 22.h),
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
    ),
  );
}
