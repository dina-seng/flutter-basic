enum EnrollmentStatus { active, completed, dropped }

class Enrollment {
  final String id;
  final String userId;
  final String courseId;
  final DateTime enrolledAt;
  final List<String> completedLessons;
  EnrollmentStatus status;

  Enrollment({
    required this.id,
    required this.userId,
    required this.courseId,
    DateTime? enrolledAt,
    List<String>? completedLessons,
    this.status = EnrollmentStatus.active,
  }) : enrolledAt = enrolledAt ?? DateTime.now(),
       completedLessons = completedLessons ?? [] {
    if (userId.trim().isEmpty || courseId.trim().isEmpty) {
      throw ArgumentError('userId and courseId cannot be empty');
    }
  }

  void markLessonComplete(String lessonId) {
    if (!completedLessons.contains(lessonId)) {
      completedLessons.add(lessonId);
    }
  }

  double getProgress(int totalLessons) {
    if (totalLessons <= 0) {
      return 0;
    }

    return completedLessons.length / totalLessons * 100;
  }

  bool isCompleted() {
    return status == EnrollmentStatus.completed;
  }

  @override
  String toString() {
    return 'Enrollment($id, user: $userId, course: $courseId, '
        'status: $status, progress lessons: ${completedLessons.length})';
  }
}
