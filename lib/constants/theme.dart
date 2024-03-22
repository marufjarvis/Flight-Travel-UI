// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
        primaryColor: AppColor.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColor.bg,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
          elevation: 0,
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: AppColor.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
        textTheme: TextTheme(
            titleSmall:
                GoogleFonts.openSans(color: AppColor.black, fontSize: 13),
            titleMedium:
                GoogleFonts.openSans(color: AppColor.black, fontSize: 17),
            titleLarge: GoogleFonts.openSans(
                color: AppColor.black,
                fontSize: 19,
                fontWeight: FontWeight.w500),
            labelSmall:
                GoogleFonts.openSans(color: AppColor.black, fontSize: 13),
            labelMedium:
                GoogleFonts.openSans(color: AppColor.black, fontSize: 17),
            labelLarge: GoogleFonts.openSans(
                color: AppColor.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold),
            bodySmall:
                GoogleFonts.openSans(color: AppColor.black, fontSize: 13),
            bodyMedium:
                GoogleFonts.openSans(color: AppColor.black, fontSize: 17),
            bodyLarge: GoogleFonts.openSans(
                color: AppColor.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold),
            displaySmall:
                GoogleFonts.openSans(color: AppColor.black, fontSize: 13),
            displayMedium:
                GoogleFonts.openSans(color: AppColor.black, fontSize: 17),
            displayLarge: GoogleFonts.openSans(
                color: AppColor.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold)));
  }
}
