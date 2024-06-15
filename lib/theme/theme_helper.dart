
import 'package:flutter/material.dart'; 
import '../utils/app_export.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable


class ThemeHelper {
  // A map of custom color themes supported by the app 
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = { 
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() { 
    var colorScheme =
      _supportedColorScheme [_appTheme] ?? ColorSchemes.lightCodeColorScheme; 
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme (colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.blueGray200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          shadowColor: appTheme.black900.withOpacity(0.4),
          elevation: 1,
          visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) { 
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: colorScheme.primary,
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.black900,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme. 
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}


class TextThemes {
  static TextTheme textTheme (ColorScheme colorScheme) => TextTheme( 
    bodyLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 17.fSize,
      fontFamily: 'SF Pro Text',
      fontWeight: FontWeight.w400,
    ),    
    bodyMedium: TextStyle(
      color: appTheme.blueA400, 
      fontSize: 14.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: appTheme.gray60003,
      fontSize: 12.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      color: appTheme.cyan400,
      fontSize: 32.fSize,
      fontFamily: 'Sansation',
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      color: appTheme.black900, 
      fontSize: 25.fSize,
      fontFamily: 'SF Pro',
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 13.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 10.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 20.fSize,
      fontFamily: 'Cabin',
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 16.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 14.fSize,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    ),
  );
}

/// Class containing the supported color schemes. 
class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light( 
    primary: Color (0XFFAAA5A5),
    secondaryContainer: Color (0XFFCECECE),
    onPrimary: Color (0XFF3C3C43),
    onPrimaryContainer: Color (0XFFFFFFFF),
  );
}

/// Class containing custom colors for a lightCode theme. 
class LightCodeColors {
  // Amber
  Color get amber400 => const Color (0XFFF4DE19);
  // Black
  Color get black900 => const Color (0XFF000000);
  // Blue
  Color get blue400 => const Color (0XFF3FA1FC); 
  Color get blueA400 => const Color (0XFF256EFB); 
  Color get blueA700 => const Color (0XFF3369FF);
  // BlueGray
  Color get blueGray100 => const Color (0XFFCCCCCC);
  Color get blueGray10001 => const Color (0XFFD9D9D9);
  Color get blueGray10002 => const Color (0XFFD1D2D9);
  Color get blueGray200 => const Color (0XFFABB0BA);
  Color get blueGray400 => const Color (0XFF8C8C8C);
  Color get blueGray40001 => const Color (0XFF888888);
  // BlueGrayf
  Color get blueGray1007f => const Color (0X7FD5D5D5);
  // Cyan
  Color get cyan400 => const Color (0XFF32ACD3);
  // Gray
  Color get gray100 => const Color (0XFFF5F5F5);
  Color get gray200 => const Color (0XFFEEEDED);
  Color get gray20001 => const Color (0XFFEBEBEB);
  Color get gray20002 => const Color (0XFFEEECEC);
  Color get gray300 => const Color (0XFFE5D9D9);
  Color get gray400 => const Color (0XFFB5B5B5);
  Color get gray40001 => const Color (0XFFAEAEAE);
  Color get gray50 => const Color (0XFFFBFBFB);
  Color get gray500 => const Color (0XFFA1A1A1);
  Color get gray5001 => const Color (0XFFEEFDFF);
  Color get gray5002 => const Color (0XFFFCF9F9);
  Color get gray600 => const Color (0XFF6D6D6D);
  Color get gray60001 => const Color (0XFF898585);
  Color get gray60002 => const Color (0XFF818080);
  Color get gray60003 => const Color (0XFF828080);
  Color get gray60004 => const Color (0XFF7D7D7D);
  Color get gray700 => const Color (0XFF555555);
  // Grayf
  Color get gray7003f => const Color (0X3F626161); 
  // Green
  Color get green400 => const Color (0XFF4ECB71); 
  // White
  Color get whiteA700 => const Color (0XFFFCFCFE);
}