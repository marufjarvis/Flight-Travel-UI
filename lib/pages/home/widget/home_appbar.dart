import 'package:booking_app/constants/string.dart';
import 'package:flutter/material.dart';

AppBar homeAppbar(BuildContext context) {
  return AppBar(
    toolbarHeight: 80,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppString.hello),
        Text(
          AppString.where,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    ),
  );
}
