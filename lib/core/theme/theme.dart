import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se7ety_app_1/core/font/app_font.dart';
import 'package:se7ety_app_1/core/utils/app_color.dart';

final appTheme = ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true),
    //---------------------inputdecoration----------------
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Appcolors.primaryColor,
      suffixIconColor: Appcolors.primaryColor,
      hintStyle: getmeduimfont(color: Colors.grey),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    fontFamily: GoogleFonts.cairo().fontFamily);
