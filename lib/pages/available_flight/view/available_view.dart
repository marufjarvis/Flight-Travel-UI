import 'package:booking_app/pages/available_flight/view/available_page.dart';
import 'package:booking_app/pages/home/model/flight_model.dart';
import 'package:flutter/material.dart';

class AvailableView extends StatelessWidget {
  const AvailableView({super.key, required this.availableFlight});
  final List<Available> availableFlight;

  @override
  Widget build(BuildContext context) {
    return AvailablePage(
      availableFlight: availableFlight,
    );
  }
}
