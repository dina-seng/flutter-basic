# 📱 Mobile Dart & OOP Practice Exercises

A repository containing Dart exercises, tests, and domain-driven OOP implementations focusing on **clean architecture (Model-Service-Test)**, encapsulation, and unit testing.

---

## 📂 Repository Structure

```
.
├── LMS-Project/                    # Learning Management System (OOP & Layered Architecture)
│   ├── model/                      # Entities (User, Course, Lesson, Enrollment)
│   ├── service/                    # Business logic (UserService, CourseService, EnrollmentService)
│   └── test/                       # Unit and integration test suite
│
├── clinic_appointments_practice/   # Clinic appointment management system
│   ├── lib/model/                  # Patient, Doctor, Appointment entities
│   ├── lib/service/                # AppointmentService
│   └── lib/test/                   # Appointment unit tests
│
├── W4 - TEST - G1/                 # The Library System
│   └── W4 - TEST - G1/
│       ├── lib/model/              # Member, Book
│       ├── lib/service/            # LibraryService (borrowing limits for Regular vs Premium)
│       └── lib/test/               # Unit tests
│
├── W4 - TEST - G2/                 # The Cinema Booking System
│   └── W4 - TEST - G2/
│       ├── lib/model/              # Customer, Movie
│       ├── lib/service/            # CinemaService (age restrictions)
│       └── lib/test/               # Unit tests
│
├── W4 - TEST - G3/                 # The Delivery Company
│   └── W4 - TEST - G3/
│       ├── lib/model/              # Parcel, Truck
│       ├── lib/service/            # DeliveryService (maximum truck weight rules)
│       └── lib/test/               # Unit tests
│
└── W4 - TEST - G4/                 # The Clinic Appointments (Cancellation)
    └── W4 - TEST - G4/
        ├── lib/model/              # Doctor, Patient, Appointment
        ├── lib/service/            # AppointmentService (cancellation slot management)
        └── lib/test/               # Unit tests
```

---

## 🧪 How to Run Tests

Ensure you have Dart SDK installed (`dart --version`). For each module, navigate into its project directory and run the test suite:

### 1. Clinic Appointments Practice
```bash
cd clinic_appointments_practice
dart test lib/test/appointment_test.dart
```

### 2. W4 - TEST - G1 (The Library)
```bash
cd "W4 - TEST - G1/W4 - TEST - G1"
dart test lib/test/library_test.dart
```

### 3. W4 - TEST - G2 (The Cinema)
```bash
cd "W4 - TEST - G2/W4 - TEST - G2"
dart test lib/test/cinema_test.dart
```

### 4. W4 - TEST - G3 (The Delivery Company)
```bash
cd "W4 - TEST - G3/W4 - TEST - G3"
dart test lib/test/delivery_test.dart
```

### 5. W4 - TEST - G4 (The Clinic Appointments)
```bash
cd "W4 - TEST - G4/W4 - TEST - G4"
dart test lib/test/appointment_test.dart
```

---

## 📌 Tracked Issues & Milestones

The remaining features and test implementations are tracked via GitHub issues:

- [#1] **LMS-Project**: Implement `CourseService` (Phase 2)
- [#2] **W4 - TEST - G1**: Fix Premium Member Borrowing Limit & Test
- [#3] **LMS-Project**: Implement `EnrollmentService` (Phase 2)
- [#4] **LMS-Project**: Write Unit & Integration Tests (Phase 3)
- [#5] **W4 - TEST - G2**: Implement Age Restriction Rules & Tests
- [#6] **W4 - TEST - G3**: Implement Maximum Weight Rules & Tests
- [#7] **W4 - TEST - G4**: Implement Appointment Cancellation Rules & Tests
