
import 'package:flutter/material.dart';
import '../utils/app_export.dart';
class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
    color: appTheme.blueGray10001,
  );
  static BoxDecoration get fillBluegray10001 => BoxDecoration( 
    color: appTheme.blueGray10001.withOpacity(0.4),
  );
  static BoxDecoration get fillBluegray10002 => BoxDecoration( 
    color: appTheme.blueGray10002,
  );
  static BoxDecoration get fillCyan => BoxDecoration(
    color: appTheme.cyan400,
  );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray100,
  );
  static BoxDecoration get fillGray20002 => BoxDecoration( 
    color: appTheme.gray20002,
  );
  static BoxDecoration get fillGray5001 => BoxDecoration(
    color: appTheme.gray5001,
  );
  static BoxDecoration get fillGray5002 => BoxDecoration(
    color: appTheme.gray5002,
  );
  static BoxDecoration get fillonPrimaryContainer => BoxDecoration( 
    color: theme.colorScheme.onPrimaryContainer,
  );
  // Outline decorations
  static BoxDecoration get outlineBlack => const BoxDecoration();
  static BoxDecoration get outlineBlueGray =>  BoxDecoration(
    color: appTheme.gray50,
    border: Border.all(
      color: appTheme.blueGray100,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineBlueGrayF => BoxDecoration(
    color: appTheme.cyan400,
    border: Border.all(
      color: appTheme.blueGray1007f,
      width: 1.h,
    ),
  );
  
  static BoxDecoration get outlineCyan => BoxDecoration( 
    color: appTheme.cyan400.withOpacity(0.34),
    border: Border.all(
      color: appTheme.cyan400,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlineGray => BoxDecoration(
    color: theme.colorScheme.onPrimaryContainer,
    border: Border.all(
      color: appTheme.gray300,
      width: 1.h,
    ),
    boxShadow: [
      BoxShadow(
        color: appTheme.black900.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(
          0,
          4,
        ),
      ),
    ],
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
    16.h,
  );
  static BorderRadius get circleBorder20 => BorderRadius.circular(
    20.h,
  );
  static BorderRadius get circleBorder28 => BorderRadius.circular(
    28.h,
  );
  static BorderRadius get circleBorder50 => BorderRadius.circular(
    50.h,
  );
  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
    10.h,
  );
  static BorderRadius get roundedBorder2 => BorderRadius.circular(
    2.h,
  );
  static BorderRadius get roundedBorder32 => BorderRadius.circular(
    32.h,
  );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
    5.h, 
  );
  static BorderRadius get roundedBorder94 => BorderRadius.circular(
    94.h,
  );
}