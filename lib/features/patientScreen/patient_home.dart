import 'package:flutter/material.dart';
import 'package:se7ety_app_1/core/font/app_font.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'صحتي',
          style: getlargefont(),
        ),
      ),
    );
  }
}
