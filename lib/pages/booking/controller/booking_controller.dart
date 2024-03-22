// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/pages/home/model/flight_model.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  var selectedFlight =
      Available(time: 'none', flightNo: 'none', price: 0, hour: 0).obs;
}
