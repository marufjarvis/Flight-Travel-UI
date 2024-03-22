import 'package:booking_app/pages/home/model/place.dart';

import '../pages/home/model/flight_model.dart';

class LocalDataSource {
  static List<PlaceModel> getPlaces() {
    return [
      PlaceModel(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS42hHHNMxKXbpEudtP-SjxCtpd5b-VgLaP1g&usqp=CAU'),
      PlaceModel(
          'https://media-cdn.tripadvisor.com/media/photo-s/1b/11/ce/96/gulfside-and-poolview.jpg'),
      PlaceModel(
          'https://i0.wp.com/theluxurytravelexpert.com/wp-content/uploads/2015/04/las-ventanas-al-paraiso-los-cabos-mexico.jpg?ssl=1'),
      PlaceModel(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7hqb1rMkK5SpT99Vj8pRUNaLArjJi1FToK2a2EGiCyzq6vSaMgDMqq8lCz-NShg3UlIY&usqp=CAU'),
      PlaceModel(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSLC_dbjgedgkdpt-sUWg8aI5GTTf6mcr0hpwP1RWqXxFJGZkuZ7dxKG-fWVLMsitxSyI&usqp=CAU'),
    ];
  }

  static Flight flight() {
    return Flight(
        startAddress: "Newyork City",
        startShortAddress: "NYC",
        destinationAddress: 'London City',
        destinationShortAddress: "LND",
        date: "5 May 2023",
        availableFlight: [
          Available(time: '8:30 PM', flightNo: "EL234", price: 980, hour: 10),
          Available(time: '5:00 AM', flightNo: "FK234", price: 600, hour: 20),
          Available(time: '6:30 AM', flightNo: "GL234", price: 450, hour: 30),
          Available(time: '10:30 AM', flightNo: "OL234", price: 1300, hour: 5),
          Available(time: '12:30 PM', flightNo: "KL234", price: 2000, hour: 3),
        ]);
  }
}
