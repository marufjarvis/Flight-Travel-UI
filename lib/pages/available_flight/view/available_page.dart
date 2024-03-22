// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:booking_app/pages/home/controller/home_controller.dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:booking_app/constants/color.dart';
import 'package:booking_app/constants/string.dart';
import 'package:booking_app/pages/home/model/flight_model.dart';
import 'package:booking_app/pages/home/widget/flight.dart';

class AvailablePage extends StatefulWidget {
  const AvailablePage({
    Key? key,
    required this.availableFlight,
  }) : super(key: key);
  final List<Available> availableFlight;

  @override
  State<AvailablePage> createState() => _AvailablePageState();
}

class _AvailablePageState extends State<AvailablePage> {
  final homecontroller = Get.put(HomeControlller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          itemCount: widget.availableFlight.length,
          itemBuilder: (context, index) {
            final availableFlight = widget.availableFlight[index];
            return GestureDetector(
              onTap: () => Get.toNamed(AppString.bookingRoute,
                  arguments: availableFlight),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FlightWidget(
                  top: Container(
                    color: AppColor.white,
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Top(
                          startLocation:
                              homecontroller.flight.value.startShortAddress,
                          fullLocation:
                              homecontroller.flight.value.startAddress,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 2.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Text(
                            "${availableFlight.hour} Hours",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: AppColor.primary, fontSize: 10),
                          ),
                        ),
                        Top(
                          startLocation: homecontroller
                              .flight.value.destinationShortAddress,
                          fullLocation:
                              homecontroller.flight.value.destinationAddress,
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
                              time: availableFlight.time.toString(),
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
                                          color:
                                              Theme.of(context).primaryColor)),
                                ],
                              ),
                            ),
                            Bottom(
                              location: "Flight No",
                              time: availableFlight.flightNo.toString(),
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
                              "${availableFlight.price}\$",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColor.primary,
                                  ),
                            ),
                            Text(
                              "One Way",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
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
              ),
            );
          }),
    );
  }

  AppBar appBar(BuildContext context) {
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
        "Available Flights",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            Icons.filter_2,
            color: AppColor.black,
          ),
        )
      ],
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({
    super.key,
    required this.time,
    required this.location,
  });

  final String time;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        location,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: AppColor.black.withOpacity(0.5), fontSize: 11),
      ),
      const SizedBox(
        height: 3.0,
      ),
      Text(
        time,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: AppColor.black, fontSize: 16),
      ),
    ]);
  }
}

class Top extends StatelessWidget {
  const Top(
      {super.key, required this.startLocation, required this.fullLocation});
  final String startLocation;
  final String fullLocation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "($startLocation)",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColor.primary, fontSize: 19),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            fullLocation,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColor.black.withOpacity(0.5), fontSize: 11),
          ),
        ],
      ),
    );
  }
}
