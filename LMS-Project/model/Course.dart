import 'User.dart';

class Course {
  final String courseID;
  final String courseTitle;
  String description;
  List<User> instructorID = [];

  List<Object> lessons = [];

  Course({
    required this.courseID,
    required this.courseTitle,
    this.description = "",
    required this.instructorID,
  });

  void addLesson(lesson) {}

  void getLessonCount() {}

  @override
  String toString() {
    return "Course information: $courseID : $courseTitle : $description";
  }
}
