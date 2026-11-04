import '../model/parcel.dart';
import '../model/truck.dart';

class DeliveryService {
  final List<Parcel> parcels = [];
  final List<Truck> trucks = [];

  void addParcel({
    required String parcelId,
    required String destination,
    required int weightKg,
  }) {
    // ! Parcel shall not exist already
    if (_findParcelOrNull(parcelId) != null) {
      throw Exception('Parcel $parcelId already exists');
    }
    parcels.add(Parcel(id: parcelId, destination: destination, weightKg: weightKg));
  }

  void addTruck({required String truckId, required int maxParcels}) {
    // ! Truck shall not exist already
    if (_findTruckOrNull(truckId) != null) {
      throw Exception('Truck $truckId already exists');
    }
    trucks.add(Truck(id: truckId, maxParcels: maxParcels));
  }

  void loadParcel({required String parcelId, required String truckId}) {
    // ! Parcel shall exist
    Parcel? parcel = _findParcelOrNull(parcelId);
    if (parcel == null) {
      throw Exception('Parcel $parcelId not found');
    }

    // ! Truck shall exist
    Truck? truck = _findTruckOrNull(truckId);
    if (truck == null) {
      throw Exception('Truck $truckId not found');
    }

    // ! Parcel shall not be loaded in a truck already
    if (_findTruckOfParcelOrNull(parcelId) != null) {
      throw Exception('Parcel $parcelId is already loaded');
    }

    // ! Truck shall not be full
    if (truck.isFull) {
      throw Exception('Truck $truckId is full');
    }

    truck.parcels.add(parcel);
  }

  void unloadParcel({required String parcelId}) {
    // ! Parcel shall be loaded in a truck
    Truck? truck = _findTruckOfParcelOrNull(parcelId);
    if (truck == null) {
      throw Exception('Parcel $parcelId is not loaded');
    }

    truck.parcels.removeWhere((p) => p.id == parcelId);
  }

  Parcel? _findParcelOrNull(String parcelId) {
    for (Parcel p in parcels) {
      if (p.id == parcelId) return p;
    }
    return null;
  }

  Truck? _findTruckOrNull(String truckId) {
    for (Truck t in trucks) {
      if (t.id == truckId) return t;
    }
    return null;
  }

  Truck? _findTruckOfParcelOrNull(String parcelId) {
    for (Truck t in trucks) {
      for (Parcel p in t.parcels) {
        if (p.id == parcelId) return t;
      }
    }
    return null;
  }
}
