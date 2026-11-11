import 'dart:vmservice_io';

import 'package:lms_layered_architecture_example/model/booking.dart';
import 'package:test/test.dart';

import '../service/sports_center_service.dart';

void main() {
  test('adds a court', () {
    final sportsCenterService = SportsCenterService();

    sportsCenterService.addCourt(
        courtId: 'C1', courtName: 'Badminton 1', isIndoor: true);

    expect(sportsCenterService.courts.length, 1);
    expect(sportsCenterService.courts.first.name, 'Badminton 1');
    expect(sportsCenterService.courts.first.isIndoor, true);
  });

  test('cannot add a court whose ID already exists', () {
    final sportsCenterService = SportsCenterService();
    sportsCenterService.addCourt(courtId: 'C1', courtName: 'Badminton 1');

    expect(
      () => sportsCenterService.addCourt(courtId: 'C1', courtName: 'Tennis 1'),
      throwsException,
    );
  });

  test('cannot add a court with an empty name', () {
    final sportsCenterService = SportsCenterService();

    expect(
      () => sportsCenterService.addCourt(courtId: 'C1', courtName: ''),
      throwsException,
    );
  });

  // TODO Q3: add your 2 tests here

  test('Valid Booing', () {
    final sportsCenterService = SportsCenterService();

    sportsCenterService.addCourt(
        courtId: 'C1', courtName: 'Badminton 1', isIndoor: true);

    sportsCenterService.bookCourt(
        customerName: 'Dara', courtId: 'C1', slot: TimeSlot.evening);

    expect(sportsCenterService.bookings.first.price, 12);
  });

  test('Invalid Booking', () {
    final sportsCenterService = SportsCenterService();

    sportsCenterService.addCourt(
        courtId: 'C1', courtName: 'Badminton 1', isIndoor: true);

    sportsCenterService.bookCourt(
        customerName: 'Dara', courtId: 'C1', slot: TimeSlot.evening);

    expect(
        () => sportsCenterService.bookCourt(
            customerName: 'Dina', courtId: 'C1', slot: TimeSlot.morning),
        throwsException);

    expect(sportsCenterService.bookings.length, 1);
  });
}
