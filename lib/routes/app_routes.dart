import 'package:flutter/material.dart';
import '../pages/open_screen.dart';

class AppRoutes {
  static const String initialRoute = openScreen; // Correctly reference the open screen route as the initial route
  static const String openScreen = '/open_screen';

  static Map<String, WidgetBuilder> routes = {
    openScreen: (context) => OpenScreen(),
    initialRoute: (context) => OpenScreen(),
  };
}
