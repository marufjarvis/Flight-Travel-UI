// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/constants/color.dart';
import 'package:booking_app/pages/home/controller/home_controller.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeButton extends StatelessWidget {
  const TypeButton({
    super.key,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final HomeControlller homeControlller = Get.put(HomeControlller());
    return Expanded(
      child: Obx(() {
        return ElevatedButton(
          onPressed: () {
            homeControlller.currentType.value = title;
          },
          style: ButtonStyle(
            side: MaterialStatePropertyAll(BorderSide(
                width: 1,
                color: homeControlller.selectType(title) == true
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).scaffoldBackgroundColor)),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStatePropertyAll(AppColor.white),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColor.black,
                size: 18.0,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 12),
              )
            ],
          ),
        );
      }),
    );
  }
}
