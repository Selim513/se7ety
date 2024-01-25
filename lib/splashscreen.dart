import 'package:flutter/material.dart';
import 'package:se7ety_app_1/core/function/navigator.dart';
import 'package:se7ety_app_1/features/welcomePages/welcome_Page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      gotoreplacement(context, const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/logo.png',
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}
