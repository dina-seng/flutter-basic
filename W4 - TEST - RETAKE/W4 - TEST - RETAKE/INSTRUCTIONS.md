# G5 — The Sports Center

> **Duration: 60 minutes.** Suggested timing: Q1 ≈ 25 min · Q2 ≈ 20 min · Q3 ≈ 15 min.

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
> dart test test/sports_center_test.dart
> ```

The code is organized into three layers: **Model, Service, and Test**.

### 1. Model Layer

- **Court**: Has an `id`, a `name`, and `isIndoor` (whether the court is inside a building).
- **TimeSlot** (in `booking.dart`): An enum with the three time slots of the day: `morning`, `afternoon` and `evening`. You will complete it, and write the rest of this file, in Q1.

### 2. Service Layer

The `SportsCenterService` manages all the courts of the sports center and enforces the business rules.

- **`addCourt`**: Adds a new court. Throws an exception if the court ID already exists, or if the court name is empty.

### 3. Test Layer

The three existing tests check the following scenarios:

1. A normal court creation.
2. Adding a court whose ID already exists.
3. Adding a court with an empty name.

---

## New feature: booking a court

Customers can now **book a court**. The day is divided into three **time slots**:

| Time slot | Hours | Price |
|---|---|---:|
| morning | 8:00 - 12:00 | 5 $ |
| afternoon | 12:00 - 17:00 | 8 $ |
| evening | 17:00 - 22:00 | 10 $ |

- When a customer books a court, the sports center must remember **the name of the customer**, **the court**, and **the time slot**.
- **Indoor** courts cost **2 $ more** than the price in the table.
- A booking is **not paid** when it is created. The customer **pays later**, when they arrive at the sports center.
- A court can be booked by **only one customer per time slot**.

---

## Questions

### Q1. Model — 40 points

In the `booking.dart` file, model the new feature:

- Complete the enum `TimeSlot` with two getters:
  - `String get hours`: the hours of the time slot, written as in the table (e.g. `TimeSlot.morning.hours` returns `'8:00 - 12:00'`);
  - `int get price`: the price of the time slot (e.g. `TimeSlot.morning.price` returns `5`).
- Create a class `Booking` that stores **all the information** described in the new feature.
  - Think carefully about which information can **change** after the booking is created, and which cannot.
- Add to `Booking` a getter `int get price` that returns the price of the booking: the price of its time slot, plus the indoor extra if needed.

### Q2. Service — 30 points

Implement the following changes in the service layer:

- The service must now keep **all the bookings** in a list named `bookings`.
- Create a new method:
  ```dart
  void bookCourt({required String courtId, required String customerName, required TimeSlot slot})
  ```
  - **Precondition:** the court must exist.
  - **Precondition:** the customer name must not be empty.
  - **Precondition:** the court must not already be booked for this time slot.
  - If a precondition fails, throw an exception. Otherwise, add a new booking.
- Create a new method:
  ```dart
  List<TimeSlot> freeSlots(String courtId)
  ```
  It returns the time slots that are **not booked yet** for this court.

> Tip: `TimeSlot.values` gives you the list of all the time slots.

### Q3. Tests — 30 points

Write **two tests**:

1. **Valid booking:** Create an **indoor** court `C1` and book it in the `evening`. Verify that:
   - the price of the booking is `12`, **and**
   - `freeSlots('C1')` returns only `morning` and `afternoon`.
2. **Invalid booking:** Two customers try to book court `C1` in the `morning`. Verify that:
   - an exception is thrown for the second customer, **and**
   - there is still only **one** booking.

The 3 existing tests must still pass.
