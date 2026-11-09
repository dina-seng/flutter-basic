import 'parcel.dart';

class Truck {
  final String id;
  final int maxParcels;
  final List<Parcel> parcels = [];

  int maxWeightKg;

  Truck(
      {required this.id, required this.maxParcels, required this.maxWeightKg});

  bool get isFull => parcels.length >= maxParcels;

  int get currentWeightKg =>
      parcels.fold(0, (sum, parcel) => sum + parcel.weightKg);
}
