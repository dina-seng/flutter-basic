# G3 — The Delivery Company

## Instructions

**Analyze the starter code first!**

> **IMPORTANT — Before compiling the project**
>
> Run the following command in the terminal:
>
> ```bash
> dart pub get
> ```
>
> To run the tests, open a terminal **inside the `START-CODE` folder** and run:
>
> ```bash
> dart test test/delivery_test.dart
> ```

The code is organized into three layers: **Model, Service, and Test**.

### 1. Model Layer

- **Parcel**: Has an `id`, a `destination`, and a weight in kilograms (`weightKg`).
- **Truck**: Has an `id`, a maximum number of parcels (`maxParcels`), and the list of parcels loaded in it.
- **`isFull`**: Indicates whether the truck has reached its maximum number of parcels.

### 2. Service Layer

The `DeliveryService` manages all parcels and trucks and enforces the business rules.

- **`addParcel`**: Adds a new parcel. Throws an exception if the parcel ID already exists.
- **`addTruck`**: Adds a new truck. Throws an exception if the truck ID already exists.
- **`loadParcel`**: Loads a parcel into a truck.
- **`unloadParcel`**: Removes a parcel from the truck it is loaded in.

### 3. Test Layer

The three existing tests check the following scenarios:

1. A normal loading.
2. Loading a parcel into a full truck.
3. Loading a parcel into another truck after unloading it.

---

## New rule: maximum weight

Counting parcels is not enough: a truck can carry 3 small parcels, but not 3 very heavy ones.
Each truck now has a **maximum weight** (in kg).

- The total weight of the parcels in a truck must **never exceed** its maximum weight.
- Reaching **exactly** the maximum weight is allowed.

---

## Questions

### Q1. Model — 20 points

In the `Truck` class:

- Add a **required** field named `maxWeightKg` of type `int`.
- Add a getter `int get currentWeightKg` that returns the **sum** of the weights of all the parcels loaded in the truck.

### Q2. Service — 40 points

Implement the following changes in the service layer:

- Update `addTruck` to accept a **required** `maxWeightKg` parameter.
  - **New precondition:** `maxWeightKg` must be greater than `0`. Otherwise, throw an exception.
- Update `loadParcel` to enforce the weight rule:
  - If loading the parcel would make the truck **exceed** its maximum weight, throw an exception.
  - Otherwise, continue with the existing loading rules.

> **Warning:** because `maxWeightKg` is now required, the 3 existing tests will no longer compile.
> Update them by adding `maxWeightKg: 1000` to every call to `addTruck`.

### Q3. Tests — 40 points

Write **two tests** to verify the weight rule. Use a truck with a maximum weight of `100` kg.

1. **Valid loading (limit case):** Load a parcel of 60 kg and a parcel of 40 kg. Both are accepted and the truck weighs exactly 100 kg.
2. **Invalid loading:** After loading the two parcels above, a parcel of 1 kg is refused. Verify that:
   - an exception is thrown, **and**
   - the truck still contains only 2 parcels (the truck is unchanged).

The 3 existing tests must still pass.
