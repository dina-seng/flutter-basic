# G1 — The Library

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
> dart test test/library_test.dart
> ```

The code is organized into three layers: **Model, Service, and Test**.

### 1. Model Layer

- **Member**: Has an `id` and a `name`.
- **Book**: Has an `id`, a `title`, and a `borrower` (the member who borrowed it, or `null`).
- **`isBorrowed`**: Indicates whether the book is currently borrowed.

### 2. Service Layer

The `LibraryService` manages all members and books and enforces the business rules.

- **`addMember`**: Adds a new member. Throws an exception if the member ID already exists.
- **`addBook`**: Adds a new book. Throws an exception if the book ID already exists.
- **`borrowBook`**: A member borrows a book.
- **`returnBook`**: A borrowed book is returned to the library.

### 3. Test Layer

The three existing tests check the following scenarios:

1. A normal borrowing.
2. Borrowing a book that is already borrowed.
3. Borrowing a book again after it was returned.

---

## New rule: borrowing limit

Currently, a member can borrow as many books as they want. The library wants to limit this:

| Member type | Maximum books at the same time |
|---|---|
| Regular | 2 |
| Premium | 4 |

---

## Questions

### Q1. Model — 20 points

In the `Member` class:

- Add a field named `isPremium` of type `bool`. It is **optional** in the constructor and its default value is `false`.
- Add a getter `int get maxBooks` that returns the maximum number of books this member can borrow at the same time (see the table above).

### Q2. Service — 40 points

Implement the following changes in the service layer:

- Update `addMember` to accept an optional `isPremium` parameter (default `false`).
- Update `borrowBook` to enforce the borrowing limit:
  - Count how many books the member is **currently** borrowing.
  - If this number has already reached the member's `maxBooks`, throw an exception.
  - Otherwise, continue with the existing borrowing rules.

> Tip: you can write a private helper method `_countBorrowedBooks(String memberId)`.

### Q3. Tests — 40 points

Write **two tests** to verify the borrowing limit:

1. **Invalid borrowing:** A regular member who already borrowed 2 books cannot borrow a 3rd one. Verify that an exception is thrown.
2. **Valid borrowing:** A premium member who already borrowed 2 books can borrow a 3rd one.

The 3 existing tests must still pass.
