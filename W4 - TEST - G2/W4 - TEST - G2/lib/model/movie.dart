import 'customer.dart';

class Movie {
  final String id;
  final String title;
  final int seats;
  final List<Customer> audience = [];

  int minAge;

  Movie(
      {required this.id,
      required this.title,
      required this.seats,
      this.minAge = 0});

  bool get isSoldOut => audience.length >= seats;
   
  bool isAllowedFor(int age) =>  (age > minAge) ? true : false; 
}
