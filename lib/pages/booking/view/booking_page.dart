// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/constants/color.dart';
import 'package:booking_app/pages/available_flight/view/available_page.dart';
import 'package:booking_app/pages/booking/model/set_model.dart';
import 'package:booking_app/pages/home/controller/home_controller.dart.dart';
import 'package:booking_app/pages/home/model/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:booking_app/pages/home/widget/flight.dart';

import 'package:book_my_seat/book_my_seat.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, required this.availableFlight});
  final Available availableFlight;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  Set<SeatNumber> selectedSeats = {};

  final homeControlller = Get.put(HomeControlller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bookingAppbar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            FlightWidget(
              top: Container(
                color: AppColor.white,
                height: 70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Top(
                      startLocation:
                          homeControlller.flight.value.startShortAddress,
                      fullLocation: homeControlller.flight.value.startAddress,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 2.0),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Text(
                        "20h Hours",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColor.primary, fontSize: 10),
                      ),
                    ),
                    Top(
                      fullLocation:
                          homeControlller.flight.value.destinationAddress,
                      startLocation:
                          homeControlller.flight.value.destinationShortAddress,
                    ),
                  ],
                ),
              ),
              bottom: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                height: 90,
                color: AppColor.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Bottom(
                          location: "Flight Time",
                          time: widget.availableFlight.time,
                        ),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 12,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                    Container(
                                      width: 100,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      child: Dash(
                                        width: 6,
                                        height: 1,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor
                                            .withOpacity(0.8),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 5,
                                  left: 48,
                                  child: Icon(Icons.location_history,
                                      color: Theme.of(context).primaryColor)),
                            ],
                          ),
                        ),
                        Bottom(
                          time: widget.availableFlight.flightNo,
                          location: 'Flight No',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.availableFlight.price}\$",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.primary,
                                  ),
                        ),
                        Text(
                          "One Way",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 14,
                                    color: AppColor.black.withOpacity(0.5),
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              width: double.infinity,
              borderRadius: 15,
              punchRadius: 15,
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Title(),
            SelectSeat(selectedSeats: selectedSeats),
            const SeatInfo(),
            const SizedBox(
              height: 16.0,
            ),
            const BookButton()
          ],
        ),
      ),
    );
  }

  AppBar bookingAppbar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColor.black,
          ),
        ),
      ),
      leadingWidth: 30,
      title: Text(
        "Select your seat",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Business Class",
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
    );
  }
}

class BookButton extends StatelessWidget {
  const BookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Successfully Booked'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        );
      },
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColor.primary)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Book Now",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}

class SeatInfo extends StatelessWidget {
  const SeatInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  color: Colors.grey.shade700,
                ),
                const SizedBox(width: 2),
                const Text(' Disabled ')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  color: Colors.lightBlueAccent,
                ),
                const SizedBox(width: 2),
                const Text(' Sold ')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff0FFF50))),
                ),
                const SizedBox(width: 2),
                const Text(' Available ')
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  color: const Color(0xff0FFF50),
                ),
                const SizedBox(width: 2),
                const Text(' Selected')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectSeat extends StatelessWidget {
  const SelectSeat({
    super.key,
    required this.selectedSeats,
  });

  final Set<SeatNumber> selectedSeats;

  @override
  Widget build(BuildContext context) {
    return SeatLayoutWidget(
      onSeatStateChanged: (rowI, colI, seatState) {
        if (seatState == SeatState.selected) {
          selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));
        } else {
          selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
        }
      },
      stateModel: const SeatLayoutStateModel(
        rows: 6,
        cols: 7,
        seatSvgSize: 45,
        pathSelectedSeat: 'assets/seat_selected.svg',
        pathDisabledSeat: 'assets/seat_disabled.svg',
        pathSoldSeat: 'assets/seat_sold.svg',
        pathUnSelectedSeat: 'assets/seat_unselected.svg',
        currentSeatsState: [
          [
            SeatState.disabled,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.empty,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.sold,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.empty,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.empty,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.empty,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.empty,
            SeatState.unselected,
            SeatState.sold,
            SeatState.sold,
          ],
          [
            SeatState.sold,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.empty,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.empty,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.sold,
            SeatState.sold,
            SeatState.unselected,
            SeatState.empty,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.unselected,
          ],
          [
            SeatState.empty,
            SeatState.empty,
            SeatState.empty,
            SeatState.empty,
            SeatState.unselected,
            SeatState.unselected,
            SeatState.sold,
          ],
          [
            SeatState.unselected,
            SeatState.unselected,
            SeatState.sold,
            SeatState.sold,
            SeatState.sold,
            SeatState.unselected,
            SeatState.unselected,
          ],
        ],
      ),
    );
  }
}
