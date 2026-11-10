enum Role { STUDENT, INSTRUCTOR }

class User {
  final String userId;
  String userName;
  final String userEmail;
  final Role userRole;

  User({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userRole,
  });

  String get userID => userID;

  bool get isInstructor => userRole == Role.INSTRUCTOR;

  @override
  String toString() {
    return "User Id $userId, User Name $userName, Role $userRole";
  }
}
