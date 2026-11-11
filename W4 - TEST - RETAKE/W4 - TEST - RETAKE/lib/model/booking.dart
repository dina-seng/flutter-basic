import './court.dart';

enum TimeSlot {
  morning,
  afternoon,
  evening;

  String get hours {
    switch (this) {
      case TimeSlot.morning:
        return '8:00 - 12:00';
      case TimeSlot.afternoon:
        return '12:00 - 17:00';
      case TimeSlot.evening:
        return '17:00 - 22:00';
    }
  }

  int get price {
    switch (this) {
      case TimeSlot.morning:
        return 5;
      case TimeSlot.afternoon:
        return 8;
      case TimeSlot.evening:
        return 10;
    }
  }
}

enum Courtyoe { indoor, outdoor }

// TODO Q1: complete the TimeSlot enum, then write the Booking class here

class Booking {
  Court court;

  String customerName;
  TimeSlot status;

  Booking({
    required this.customerName,
    required this.court,
    required  this.status,
  });

  int get price => status.price;
}
