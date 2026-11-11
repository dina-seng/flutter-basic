import '../model/court.dart';
import '../model/booking.dart';

class SportsCenterService {
  final List<Court> courts = [];
 final List<Booking> bookings = [];


  void addCourt({
    required String courtId,
    required String courtName,
    bool isIndoor = false,
  }) {
    // ! Court shall not exist already
    if (_findCourtOrNull(courtId) != null) {
      throw Exception('Court $courtId already exists');
    }

    // ! Court name shall not be empty
    if (courtName.isEmpty) {
      throw Exception('Court name cannot be empty');
    }

    courts.add(Court(id: courtId, name: courtName, isIndoor: isIndoor));
  }

  void bookCourt(
      {required String courtId,
      required String customerName,
      required TimeSlot slot}) { 
    if (_findCourtOrNull(courtId) == null) {
      throw Exception('Court $courtId does not exist');
    }

    if (customerName.isEmpty) {
      throw Exception('Customer name cannot be empty');
    }

    if (!freeSlots(courtId).contains(slot)) {
      throw Exception('The court is already booked in this shift');
    }
  
  bookings.add(Booking(
    customerName: customerName, 
    courtId: courtId,
    status: slot, 
    
  ));

  }

  List<TimeSlot> freeSlots(String courtId) {
    return TimeSlot.values
        .where((slot) => !bookings.any(
              (booking) => booking.courtId == courtId && booking.status == slot,
            ))
        .toList();
  }

  Court? _findCourtOrNull(String courtId) {
    for (Court c in courts) {
      if (c.id == courtId) return c;
    }
    return null;
  }
}
