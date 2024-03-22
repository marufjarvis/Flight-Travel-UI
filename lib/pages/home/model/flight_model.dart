class Flight {
  final String startAddress;
  final String startShortAddress;
  final String destinationAddress;
  final String destinationShortAddress;
  final String date;
  final List<Available> availableFlight;

  Flight(
      {required this.startAddress,
      required this.startShortAddress,
      required this.destinationAddress,
      required this.destinationShortAddress,
      required this.date,
      required this.availableFlight});
}

class Available {
  final String time;
  final String flightNo;
  final int price;
  final int hour;

  Available(
      {required this.hour,
      required this.time,
      required this.flightNo,
      required this.price});
}
