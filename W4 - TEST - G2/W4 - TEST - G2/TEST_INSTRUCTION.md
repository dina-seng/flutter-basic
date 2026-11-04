# G2 — The Cinema

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
> dart test test/cinema_test.dart
> ```

The code is organized into three layers: **Model, Service, and Test**.

### 1. Model Layer

- **Customer**: Has an `id`, a `name`, and an `age`.
- **Movie**: Has an `id`, a `title`, a number of `seats`, and the list of customers who booked a ticket (`audience`).
- **`isSoldOut`**: Indicates whether all the seats of the movie are booked.

### 2. Service Layer

The `CinemaService` manages all customers and movies and enforces the business rules.

- **`addCustomer`**: Adds a new customer. Throws an exception if the customer ID already exists.
- **`addMovie`**: Adds a new movie. Throws an exception if the movie ID already exists.
- **`bookTicket`**: Books a ticket for a customer to watch a movie.

### 3. Test Layer

The three existing tests check the following scenarios:

1. A normal booking.
2. Booking a ticket for a sold-out movie.
3. Booking two different movies is OK, but booking the same movie twice is not.

---

## New rule: age restriction

Some movies are not suitable for children. Each movie can now have a **minimum age**.

- A customer can book a movie only if their age is **greater than or equal to** the movie's minimum age.
- A movie with a minimum age of `0` is for everyone.
- The cinema can **change** the minimum age of a movie later, but only if **every customer who already booked** this movie is still old enough.

---

## Questions

### Q1. Model — 20 points

In the `Movie` class:

- Add a field named `minAge` of type `int`. It is **optional** in the constructor and its default value is `0`. (The field must be modifiable.)
- Add a method `bool isAllowedFor(int age)` that returns `true` if a person of this age is allowed to watch the movie.

### Q2. Service — 40 points

Implement the following changes in the service layer:

- Update `addMovie` to accept an optional `minAge` parameter (default `0`).
  - **New precondition:** `minAge` must be between `0` and `18` (included). Otherwise, throw an exception.
- Update `bookTicket` to enforce the age restriction:
  - If the customer is too young for the movie, throw an exception.
  - Otherwise, continue with the existing booking rules.
- Create a new method:
  ```dart
  void updateMinAge({required String movieId, required int minAge})
  ```
  - **Precondition:** the movie must exist.
  - **Precondition:** `minAge` must be between `0` and `18` (included).
  - **Precondition:** every customer in the movie's `audience` must be allowed with the new minimum age. Otherwise, throw an exception.
  - Change the minimum age of the movie.

> Tip: you can write a private helper method `_isAudienceAllowed(Movie movie, int minAge)`.

### Q3. Tests — 40 points

Write **two tests** to verify the age restriction. Use a movie with a minimum age of `16`.

1. **Valid booking (limit case):** A customer who is **exactly 16** can book the movie.
2. **Invalid update:** A customer who is **16** books the movie, then the cinema tries to change its minimum age to `18`. Verify that:
   - an exception is thrown, **and**
   - the minimum age of the movie is still `16` (the movie is unchanged).

The 3 existing tests must still pass.
