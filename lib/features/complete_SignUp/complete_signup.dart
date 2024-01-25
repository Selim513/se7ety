import 'package:flutter/material.dart';
import 'package:se7ety_app_1/core/font/app_font.dart';

class CompleteSinup extends StatelessWidget {
  const CompleteSinup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اكمال عمليه التسجيل',
          style: getlargefont(color: Colors.white),
        ),
      ),
    );
  }
}
