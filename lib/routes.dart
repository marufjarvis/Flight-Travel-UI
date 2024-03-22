// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/constants/string.dart';
import 'package:booking_app/pages/available_flight/view/available_view.dart';
import 'package:booking_app/pages/booking/view/booking_page.dart';
import 'package:booking_app/pages/home/model/flight_model.dart';
import 'package:booking_app/pages/home/view/home_view.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage<dynamic>> ongenerateRoute() {
    return [
      GetPage(name: AppString.inititalRoute, page: () => const HomeView()),
      GetPage(
          name: AppString.availableRoute,
          page: () {
            var availableList = Get.arguments as List<Available>;
            return AvailableView(
              availableFlight: availableList,
            );
          }),
      GetPage(
          name: AppString.bookingRoute,
          page: () {
            final available = Get.arguments as Available;
            return BookingPage(
              availableFlight: available,
            );
          }),
    ];
  }
}
