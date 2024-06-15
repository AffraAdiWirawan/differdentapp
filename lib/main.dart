import 'package:flutter/material.dart'; 
import 'package:flutter/scheduler.dart'; 
import 'package:flutter/services.dart'; 
import '../utils/app_export.dart';
import 'package:pkm_mobile/pages/open_screen.dart';

var globalMessengerKey = GlobalKey <ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitUp]);
  ThemeHelper().changeTheme('primary');
  runApp (const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'Differdent',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}

