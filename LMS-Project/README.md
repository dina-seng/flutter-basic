# 📚 LMS System — Coding Exercise

## Overview
Build a **Learning Management System (LMS)** from scratch by writing all code manually.
This exercise is designed to sharpen your understanding of **clean architecture**, **OOP**, and **unit testing**.

---

## 🏗️ Project Structure

```
LMS-Project/
├── model/       → Data classes / Entities (User, Course, Enrollment, Lesson)
├── service/     → Business logic (CourseService, UserService, EnrollmentService)
└── test/        → Unit & integration tests for models and services
```

---

## 🎯 Core Domain Concepts

| Entity        | Description                                      |
|---------------|--------------------------------------------------|
| `User`        | Represents a student or instructor               |
| `Course`      | A course with title, description, and lessons    |
| `Lesson`      | A unit of content inside a course                |
| `Enrollment`  | Links a User to a Course with progress tracking  |

---

## 📋 Exercise Phases

### Phase 1 — Models (`/model`)
Define the data structures / entities with proper fields and validation.

### Phase 2 — Services (`/service`)
Implement business logic that operates on the models (CRUD + rules).

### Phase 3 — Tests (`/test`)
Write tests for every model and service to verify correctness.

---

## 💡 Tips
- Write code **manually** — no copy-paste from external sources.
- Commit after completing each phase.
- Focus on **encapsulation**, **single responsibility**, and **clear naming**.

---

## 🚀 Getting Started
1. Start in `/model` — read `TODO.md` and implement each class.
2. Move to `/service` once all models are complete.
3. Finish with `/test` to validate everything works correctly.
