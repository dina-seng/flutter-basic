import 'parcel.dart';

class Truck {
  final String id;
  final int maxParcels;
  final List<Parcel> parcels = [];

  Truck({required this.id, required this.maxParcels});

  bool get isFull => parcels.length >= maxParcels;
}
