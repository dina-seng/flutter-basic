# 🧪 Phase 3 — Tests (Validation Layer)

> Write **unit tests** and **integration tests** to verify that your models and services work correctly.
> Good tests catch bugs early and give you confidence when refactoring.

---

## 🎯 Goal
Test every method you wrote in `/model` and `/service`.
Each test should be **small**, **focused**, and **independent** (one thing per test).

> Use your language's built-in test framework (e.g., JUnit, pytest, jest, XCTest, etc.)

---

## ✅ TO-DO List

### 1. `UserModelTest`
```
File: test/UserModelTest
```
- [ ] Test: Creating a User with valid data succeeds
- [ ] Test: Creating a User with an empty name throws an error
- [ ] Test: Creating a User with an invalid email throws an error
- [ ] Test: `isInstructor()` returns `true` for instructors
- [ ] Test: `isInstructor()` returns `false` for students
- [ ] Test: `toString()` contains the user's name and email

---

### 2. `CourseModelTest`
```
File: test/CourseModelTest
```
- [ ] Test: Creating a Course with valid data succeeds
- [ ] Test: Creating a Course with an empty title throws an error
- [ ] Test: `addLesson()` increases the lesson count by 1
- [ ] Test: `getLessonCount()` returns 0 for a new course
- [ ] Test: `toString()` contains the course title

---

### 3. `LessonModelTest`
```
File: test/LessonModelTest
```
- [ ] Test: Creating a Lesson with valid data succeeds
- [ ] Test: Creating a Lesson with order < 1 throws an error
- [ ] Test: `getSummary()` returns at most 100 characters
- [ ] Test: `getSummary()` returns full content if content is shorter than 100 chars

---

### 4. `EnrollmentModelTest`
```
File: test/EnrollmentModelTest
```
- [ ] Test: Creating an Enrollment with valid data succeeds
- [ ] Test: Creating an Enrollment with null userId throws an error
- [ ] Test: `markLessonComplete()` adds lessonId to completedLessons
- [ ] Test: `markLessonComplete()` does NOT add the same lessonId twice
- [ ] Test: `getProgress()` returns 0 when no lessons are completed
- [ ] Test: `getProgress()` returns 100 when all lessons are completed
- [ ] Test: `isCompleted()` returns `true` only when status is `"completed"`

---

### 5. `UserServiceTest`
```
File: test/UserServiceTest
```
- [ ] Test: `createUser()` returns a new user with the given data
- [ ] Test: `createUser()` throws error when email is already taken
- [ ] Test: `getUserById()` returns the correct user
- [ ] Test: `getUserById()` returns null/None for unknown ID
- [ ] Test: `updateUserName()` changes the user's name
- [ ] Test: `updateUserName()` throws error for unknown ID
- [ ] Test: `deleteUser()` removes the user from storage
- [ ] Test: `getUsersByRole()` returns only users with the matching role

---

### 6. `CourseServiceTest`
```
File: test/CourseServiceTest
```
- [ ] Test: `createCourse()` creates a course linked to a valid instructor
- [ ] Test: `createCourse()` throws error when instructor ID does not exist
- [ ] Test: `createCourse()` throws error when instructor role is `"student"`
- [ ] Test: `addLessonToCourse()` adds a lesson and increases lesson count
- [ ] Test: `addLessonToCourse()` throws error for non-existent course
- [ ] Test: `deleteCourse()` removes the course
- [ ] Test: `getCoursesByInstructor()` returns only courses for that instructor

---

### 7. `EnrollmentServiceTest`
```
File: test/EnrollmentServiceTest
```
- [ ] Test: `enrollStudent()` creates an enrollment with status `"active"`
- [ ] Test: `enrollStudent()` throws error when user is an instructor (not a student)
- [ ] Test: `enrollStudent()` throws error on duplicate enrollment
- [ ] Test: `completeLesson()` marks the lesson as complete in the enrollment
- [ ] Test: `completeLesson()` sets status to `"completed"` when all lessons are done
- [ ] Test: `dropEnrollment()` sets status to `"dropped"`
- [ ] Test: `getProgressReport()` returns correct progress percentage

---

### 8. 🔗 Integration Test: `LMSIntegrationTest` *(Bonus)*
```
File: test/LMSIntegrationTest
```
> Test the full user flow end-to-end.

- [ ] Create an instructor → create a course → add 3 lessons
- [ ] Create a student → enroll in the course
- [ ] Complete lessons one by one → check progress after each
- [ ] After completing all lessons → verify enrollment status is `"completed"`
- [ ] Drop a second enrollment → verify status is `"dropped"`

---

## 📌 Final Checklist
- [ ] All model tests pass
- [ ] All service tests pass
- [ ] Edge cases (empty input, duplicates, invalid roles) are covered
- [ ] Integration test runs successfully end-to-end
- [ ] No test depends on another test's state (tests are independent)
