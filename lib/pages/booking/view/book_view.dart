import 'package:booking_app/pages/booking/view/booking_page.dart';
import 'package:booking_app/pages/home/model/flight_model.dart';
import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key, required this.available});
  final Available available;

  @override
  Widget build(BuildContext context) {
    return BookingPage(
      availableFlight: available,
    );
  }
}
