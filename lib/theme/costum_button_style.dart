
import 'package:flutter/material.dart';
import '../utils/app_export.dart';
/// A class that offers pre-defined button styles for customizing button appearance. 
class CustomButtonStyles {
// Filled button style
static ButtonStyle get fillCyan => ElevatedButton.styleFrom(
  backgroundColor: appTheme.cyan400,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.h),
  ),
);
static ButtonStyle get fillCyanTL24 => ElevatedButton.styleFrom(
  backgroundColor: appTheme.cyan400,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(24.h),
  ),
);
static ButtonStyle get fillGray => ElevatedButton.styleFrom( 
  backgroundColor: appTheme.gray60001.withOpacity(0.3), 
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.h),
  ),
);
// Outline button style
static ButtonStyle get outlinePrimaryTL10 => OutlinedButton.styleFrom(
  backgroundColor: appTheme.cyan400,
  side: BorderSide(
    color: theme.colorScheme.primary,
    width: 1,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.h),
  ),
);
static ButtonStyle get outlinePrimaryTL14 => OutlinedButton.styleFrom(
  backgroundColor: appTheme.cyan400,
  side: BorderSide(
    color: theme.colorScheme.primary,
    width: 1,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14.h),
  ),
);

static ButtonStyle get outlinePrimaryTL141 => OutlinedButton.styleFrom( 
  backgroundColor: Colors.transparent,
  side: BorderSide(
    color: theme.colorScheme.primary,
    width: 1,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(14.h),
  ),
);
// text button style
static ButtonStyle get none => ButtonStyle(
    backgroundColor:MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );
}