// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/services/local_datasource.dart';
import 'package:get/get.dart';

class HomeControlller extends GetxController {
  var currentType = "".obs;
  var flight = LocalDataSource.flight().obs;

  RxBool selectType(String title) {
    return title.toLowerCase() == currentType.value.toLowerCase()
        ? true.obs
        : false.obs;
  }
}
