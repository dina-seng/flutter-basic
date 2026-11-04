# 📦 Phase 1 — Models (Data Layer)

> Define the core **entities** of the LMS system.
> Each model represents a real-world concept with fields, constructors, and validation.

---

## 🎯 Goal
Build plain data classes/structs that can be used by the service layer.
Do **not** add business logic here — models are just data containers with light validation.

---

## ✅ TO-DO List

### 1. `User` Model
```
File: model/User
```
- [ ] Define fields:
  - `id` (unique identifier)
  - `name` (string, non-empty)
  - `email` (string, valid email format)
  - `role` (enum or string: `"student"` | `"instructor"`)
  - `createdAt` (timestamp)
- [ ] Write a constructor that validates required fields
- [ ] Override `toString()` / `__repr__` for readable output
- [ ] Add a method `isInstructor()` → returns true if role is instructor

---

### 2. `Course` Model
```
File: model/Course
```
- [ ] Define fields:
  - `id` (unique identifier)
  - `title` (string, non-empty)
  - `description` (string)
  - `instructorId` (references a User with instructor role)
  - `lessons` (list of Lesson objects, starts empty)
  - `createdAt` (timestamp)
- [ ] Write a constructor with validation (title must not be empty)
- [ ] Add method `addLesson(lesson)` → appends to the lessons list
- [ ] Add method `getLessonCount()` → returns total number of lessons
- [ ] Override `toString()` for readable output

---

### 3. `Lesson` Model
```
File: model/Lesson
```
- [ ] Define fields:
  - `id` (unique identifier)
  - `title` (string, non-empty)
  - `content` (string, the lesson material)
  - `order` (integer, lesson order within the course)
  - `durationMinutes` (integer, estimated time to complete)
- [ ] Write a constructor with validation (order must be >= 1)
- [ ] Add method `getSummary()` → returns first 100 chars of content
- [ ] Override `toString()` for readable output

---

### 4. `Enrollment` Model
```
File: model/Enrollment
```
- [ ] Define fields:
  - `id` (unique identifier)
  - `userId` (references a User)
  - `courseId` (references a Course)
  - `enrolledAt` (timestamp)
  - `completedLessons` (list of lesson IDs, starts empty)
  - `status` (enum or string: `"active"` | `"completed"` | `"dropped"`)
- [ ] Write a constructor that validates userId and courseId are not null/empty
- [ ] Add method `markLessonComplete(lessonId)` → adds to completedLessons if not already there
- [ ] Add method `getProgress(totalLessons)` → returns percentage (0–100)
- [ ] Add method `isCompleted()` → returns true if status is `"completed"`
- [ ] Override `toString()` for readable output

---

## 📌 Checklist Before Moving to `/service`
- [ ] All 4 models are implemented
- [ ] All constructors perform basic validation (throw error on bad input)
- [ ] All `toString()` / `__repr__` methods work correctly
- [ ] No business logic is inside the models (keep them clean)
