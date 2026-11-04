class Lesson {
  final String lessonId;
  final String lessonTitle;
  List<String> content = [];

  Lesson({required this.lessonId, required this.lessonTitle});

  String getSummary() {
    return "Content Sommary: ${content.length}";
  }

  @override
  String toString() {
    return "Lesson Information: ID: $lessonId, title: $lessonTitle";
  }
}
