// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/constants/string.dart';
import 'package:booking_app/constants/theme.dart';
import 'package:booking_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingApp extends StatelessWidget {
  const BookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppString.inititalRoute,
      getPages: AppRoute.ongenerateRoute(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(context),
    );
  }
}
