import '../model/User.dart';
import '../model/Course.dart';
import '../model/Lesson.dart';

import '../service/UserService.dart';

class Courseservice {
  List<Course> courses = [];
  void craateCourse({
    required String title,
    String description = '',
    required int instructorId,
  }) {
    User? instructor = UserService().getUserbyId(instructorId.toString());

    if (instructor == null || !instructor.isInstructor) {
      throw Exception('User is not an instructor');
    }

    if (title.isEmpty) {
      throw Exception('Course title cannot be empty');
    }

    String courseId = 'course_${courses.length + 1}';

    Course newCourse = Course(
      courseID: courseId,
      courseTitle: title,
      description: description,
      instructorID: [instructor],
    );

    courses.add(newCourse);
  }

  void getCourseById(String courseId) {
    if (courseId.isEmpty) {
      throw Exception('Course ID cannot be empty');
    }

    for (Course c in courses) {
      if (c.courseID == courseId) {
        print(c.toString());
        return;
      }
    }
  }

  void getAllCourses() {
    if (courses.isEmpty) {
      print('No courses available.');
      return;
    }

    for (Course c in courses) {
      print(c.toString());
    }
  }

  void addLessonToCourse(courseId, title, content, order, durationMinutes) {
    Course? course = IsCourseExist(courseId);

    if (course == null) {
      return;
    }

    Lesson newLesson = Lesson(
      lessonId: DateTime.now().millisecondsSinceEpoch.toString(),
      lessonTitle: title,
    );

    course.lessons.add(newLesson);
  }

  void deleteCourse(courseId) {
    Course? course = IsCourseExist(courseId);

    courses.remove(course);
  } 

  

  Course? IsCourseExist(String courseId) {
    for (Course c in courses) {
      if (c.courseID == courseId) {
        return c;
      }
    }
    throw Exception('Course with ID $courseId does not exist.');
  }
}
