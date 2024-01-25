import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:se7ety_app_1/core/theme/theme.dart';
import 'package:se7ety_app_1/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB4XuqxgM-nuEq75weTAVpOroaRsrYI7PA",
          appId: "com.example.se7ety_app_1",
          messagingSenderId: "136586409947",
          projectId: "se7ety-a8d8f"));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: SplashScreen()),
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
    );
  }
}
