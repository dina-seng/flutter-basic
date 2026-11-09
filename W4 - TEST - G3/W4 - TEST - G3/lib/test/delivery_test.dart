import 'package:test/test.dart';

import '../service/delivery_service.dart';

void main() {
  test('loads a parcel into a truck', () {
    final deliveryService = DeliveryService();
    deliveryService.addParcel(
        parcelId: 'P1', destination: 'Phnom Penh', weightKg: 10);
    deliveryService.addTruck(truckId: 'T1', maxParcels: 3, maxWeightKg: 1000);

    deliveryService.loadParcel(parcelId: 'P1', truckId: 'T1');

    expect(deliveryService.trucks.first.parcels.length, 1);
    expect(
        deliveryService.trucks.first.parcels.first.destination, 'Phnom Penh');
  });

  test('cannot load a parcel into a full truck', () {
    final deliveryService = DeliveryService();
    deliveryService.addParcel(
        parcelId: 'P1', destination: 'Phnom Penh', weightKg: 10);
    deliveryService.addParcel(
        parcelId: 'P2', destination: 'Siem Reap', weightKg: 5);
    deliveryService.addTruck(truckId: 'T1', maxParcels: 1, maxWeightKg: 1000);

    deliveryService.loadParcel(parcelId: 'P1', truckId: 'T1');

    expect(
      () => deliveryService.loadParcel(parcelId: 'P2', truckId: 'T1'),
      throwsException,
    );
  });

  test('an unloaded parcel can be loaded into another truck', () {
    final deliveryService = DeliveryService();
    deliveryService.addParcel(
        parcelId: 'P1', destination: 'Phnom Penh', weightKg: 10);
    deliveryService.addTruck(truckId: 'T1', maxParcels: 3, maxWeightKg: 1000);
    deliveryService.addTruck(truckId: 'T2', maxParcels: 3, maxWeightKg: 1000);

    deliveryService.loadParcel(parcelId: 'P1', truckId: 'T1');
    deliveryService.unloadParcel(parcelId: 'P1');
    deliveryService.loadParcel(parcelId: 'P1', truckId: 'T2');

    expect(deliveryService.trucks[0].parcels.isEmpty, true);
    expect(deliveryService.trucks[1].parcels.length, 1);
  });

  // TODO Q3: add your 2 tests here

  test(' Valid Loading Limit Case', () {
    final deliveryService = DeliveryService();

    deliveryService.addParcel(
        parcelId: 'P1', destination: 'Phnom Penh', weightKg: 60);

    deliveryService.addParcel(
        parcelId: 'P2', destination: 'Phnom Penh', weightKg: 40);
    deliveryService.addTruck(truckId: 'T1', maxParcels: 3, maxWeightKg: 100);
    deliveryService.addTruck(truckId: 'T2', maxParcels: 3, maxWeightKg: 100);

    deliveryService.loadParcel(parcelId: 'P1', truckId: 'T1');
    deliveryService.loadParcel(parcelId: 'P2', truckId: 'T1');

    final truck = deliveryService.trucks.where((t) => t.id == 'T1');

    expect(truck.first.currentWeightKg, 100);
  });

  test('Invalid Loading', () {
    final deliveryService = DeliveryService();

    deliveryService.addParcel(
        parcelId: 'P1', destination: 'Phnom Penh', weightKg: 60);

    deliveryService.addParcel(
        parcelId: 'P2', destination: 'Phnom Penh', weightKg: 40);
    deliveryService.addParcel(
        parcelId: 'P3', destination: 'Phnom Penh', weightKg: 40);
    deliveryService.addTruck(truckId: 'T1', maxParcels: 3, maxWeightKg: 100);
    deliveryService.addTruck(truckId: 'T2', maxParcels: 3, maxWeightKg: 100);

    deliveryService.loadParcel(parcelId: 'P1', truckId: 'T1');
    deliveryService.loadParcel(parcelId: 'P2', truckId: 'T1');

    expect(() => deliveryService.loadParcel(parcelId: 'P3', truckId: 'T1'),
        throwsException);

    final truck = deliveryService.trucks.where((t) => t.id == 'T1');

    expect(truck.first.parcels.length, equals(2));
  });
}
