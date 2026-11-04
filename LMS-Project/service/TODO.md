# ⚙️ Phase 2 — Services (Business Logic Layer)

> Implement the **business rules** of the LMS system.
> Services use the models from `/model` and contain all the logic for how the system behaves.

---

## 🎯 Goal
Each service class manages one domain area (Users, Courses, Enrollments).
Services should use **in-memory storage** (a list or dictionary) — no database needed.

---

## ✅ TO-DO List

### 1. `UserService`
```
File: service/UserService
```
- [ ] Store users in an in-memory list/map
- [ ] Implement `createUser(name, email, role)`:
  - Validate email is not already taken
  - Create and store a new `User` object
  - Return the created user
- [ ] Implement `getUserById(id)`:
  - Return the user with the matching ID, or null/None if not found
- [ ] Implement `getAllUsers()`:
  - Return all stored users
- [ ] Implement `updateUserName(id, newName)`:
  - Find user by ID, update name, return updated user
  - Throw error if user not found
- [ ] Implement `deleteUser(id)`:
  - Remove user from storage
  - Throw error if user not found
- [ ] Implement `getUsersByRole(role)`:
  - Return only users matching the given role (`"student"` or `"instructor"`)

---

### 2. `CourseService`
```
File: service/CourseService
```
- [ ] Store courses in an in-memory list/map
- [ ] Implement `createCourse(title, description, instructorId)`:
  - Validate that the instructor exists and has the instructor role (hint: use UserService)
  - Create and store a new `Course` object
  - Return the created course
- [ ] Implement `getCourseById(id)`:
  - Return the matching course or null/None
- [ ] Implement `getAllCourses()`:
  - Return all stored courses
- [ ] Implement `addLessonToCourse(courseId, title, content, order, durationMinutes)`:
  - Validate the course exists
  - Create a new `Lesson` and add it to the course
  - Return the updated course
- [ ] Implement `deleteCourse(id)`:
  - Remove the course from storage
  - Throw error if not found
- [ ] Implement `getCoursesByInstructor(instructorId)`:
  - Return all courses created by the given instructor

---

### 3. `EnrollmentService`
```
File: service/EnrollmentService
```
- [ ] Store enrollments in an in-memory list/map
- [ ] Implement `enrollStudent(userId, courseId)`:
  - Validate user exists and has role `"student"`
  - Validate course exists
  - Check student is not already enrolled in the same course (throw error if duplicate)
  - Create and store a new `Enrollment` with status `"active"`
  - Return the enrollment
- [ ] Implement `getEnrollmentById(id)`:
  - Return the matching enrollment or null/None
- [ ] Implement `getEnrollmentsByStudent(userId)`:
  - Return all enrollments for a given student
- [ ] Implement `completeLesson(enrollmentId, lessonId)`:
  - Find enrollment by ID
  - Call `markLessonComplete(lessonId)` on the enrollment
  - Check if all lessons are completed; if so, set status to `"completed"`
  - Return updated enrollment
- [ ] Implement `dropEnrollment(enrollmentId)`:
  - Find enrollment and set status to `"dropped"`
  - Return updated enrollment
- [ ] Implement `getProgressReport(enrollmentId)`:
  - Return a summary object/dict:
    ```
    {
      enrollmentId,
      userId,
      courseId,
      totalLessons,
      completedLessons,
      progressPercent,
      status
    }
    ```

---

## 📌 Checklist Before Moving to `/test`
- [ ] All 3 services are implemented
- [ ] Services reference models from `/model` (no duplicate data definitions)
- [ ] Duplicate/invalid input is handled with clear error messages
- [ ] No UI or display logic inside services (keep them pure logic)
