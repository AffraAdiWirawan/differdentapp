
import 'package:flutter/material.dart'; 
import '../utils/app_export.dart';
class OpenScreen extends StatelessWidget { 
  const OpenScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        body: Container (
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
    );
  }
}

/// Section Widget
Widget _buildHeaderRow(BuildContext context) {
  return Expanded (
    child: Container(
      margin: EdgeInsets.only (bottom: 46.v),
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.logodifferdent,
            height: 76.v,
            width: 78.h,
          ),
          SizedBox(width: 22. h),
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
                )
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
  );
}
      