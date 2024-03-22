// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:booking_app/constants/color.dart';
import 'package:booking_app/constants/string.dart';
import 'package:booking_app/pages/home/controller/home_controller.dart.dart';
import 'package:booking_app/pages/home/widget/flight.dart';
import 'package:booking_app/pages/home/widget/select_button.dart';
import 'package:booking_app/services/local_datasource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/home_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeControlller());
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: homeAppbar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SelectFlight(),
                const SizedBox(
                  height: 10.0,
                ),
                Flight(homeController: homeController),
                const SizedBox(
                  height: 14.0,
                ),
                const PopularTitle(),
                const PopularTab(),
                const TravelView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopularTitle extends StatelessWidget {
  const PopularTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      AppString.popularplace,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class PopularTab extends StatelessWidget {
  const PopularTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: AppColor.black.withOpacity(0.5),
      labelStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
      tabs: const [
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'Popular',
        ),
        Tab(
          text: 'Recommanded',
        ),
        Tab(
          text: 'Warming',
        ),
        Tab(
          text: 'Cool',
        ),
        Tab(
          text: 'Summy',
        ),
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'All',
        )
      ],
    );
  }
}

class Flight extends StatelessWidget {
  const Flight({
    super.key,
    required this.homeController,
  });

  final HomeControlller homeController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: FlightWidget(
        top: Container(
          color: Theme.of(context).primaryColor,
          height: 100,
          child: Row(
            children: [
              FlightItemTop(
                topTitle: 'Present Location',
                title: homeController.flight.value.startAddress,
                subtitle: homeController.flight.value.startShortAddress,
              ),
              Icon(
                Icons.place_outlined,
                color: AppColor.white,
                size: 45,
              ),
              FlightItemTop(
                topTitle: "End Location",
                title: homeController.flight.value.destinationAddress,
                subtitle: homeController.flight.value.destinationShortAddress,
              ),
            ],
          ),
        ),
        bottom: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          height: 130,
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  FlightBottom(
                    topTitle: "Flight Data",
                    data: homeController.flight.value.date,
                  ),
                  Icon(
                    Icons.place_outlined,
                    color: AppColor.white,
                    size: 45,
                  ),
                  const FlightBottom(
                    topTitle: "Available Seat",
                    data: "23",
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppString.availableRoute,
                      arguments: homeController.flight.value.availableFlight);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColor.white)),
                child: Text(
                  "   Search Flight   ",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColor.primary),
                ),
              )
            ],
          ),
        ),
        width: double.infinity,
        borderRadius: 15,
        punchRadius: 15,
      ),
    );
  }
}

class TravelView extends StatelessWidget {
  const TravelView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0, bottom: 20),
      height: 220,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: LocalDataSource.getPlaces().length,
          itemBuilder: (context, index) {
            final place = LocalDataSource.getPlaces()[index];
            return Container(
              margin: const EdgeInsets.only(right: 14.0),
              height: 220.0,
              width: 170.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(place.url))),
            );
          }),
    );
  }
}

class FlightBottom extends StatelessWidget {
  const FlightBottom({
    super.key,
    required this.topTitle,
    required this.data,
  });
  final String topTitle;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text(
          topTitle,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColor.white, fontSize: 14),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          data,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColor.white, fontSize: 14),
        ),
      ],
    ));
  }
}

class FlightItemTop extends StatelessWidget {
  const FlightItemTop({
    super.key,
    required this.title,
    required this.subtitle,
    required this.topTitle,
  });
  final String title;
  final String subtitle;
  final String topTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topTitle,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColor.white, fontSize: 11),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColor.white, fontSize: 19),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColor.white, fontSize: 11),
          )
        ],
      ),
    );
  }
}

class SelectFlight extends StatelessWidget {
  const SelectFlight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TypeButton(
          icon: Icons.refresh_outlined,
          title: AppString.oneway,
        ),
        const SizedBox(
          width: 10,
        ),
        const TypeButton(
          icon: Icons.air,
          title: "Aero",
        ),
        const SizedBox(
          width: 10,
        ),
        const TypeButton(
          icon: Icons.multiline_chart,
          title: "Ballistic",
        ),
      ],
    );
  }
}
