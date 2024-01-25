import 'package:flutter/material.dart';

gotopush(context, Widget newScreen) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => newScreen,
      ));
}

gotoreplacement(context, Widget newScreen) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => newScreen,
      ));
}
