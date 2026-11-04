import '../model/User.dart';

class Userservice {
  List<User> users = [];

  void createUser(String name, String email, Role role) {
    for (User user in users) {
      if (email == user.userEmail) {
        throw Exception("Duplicate Email");
      }
    }
    User newUser = User(
      userId: DateTime.now.toString(),
      userName: name,
      userEmail: email,
      userRole: role,
    );

    users.add(newUser);
  }

  User? getUserbyId(String id) {
    return _findUserOrNull(id);
  }

  void getAllUser() {
    for (User user in users) {
      print("User $user");
    }
  }

  User? updateUserName(String id, String newName) {
    for (User user in users) {
      if (id == user.userId) {
        user.userName = newName;
        return user;
      }
    }
    throw Exception("User ${id} not found");
  }

  void deleteUser(String id) {
    User? user = _findUserOrNull(id);

    if (user == null) {
      print("User Not Found");
    }

    users.remove(user);
  }

  User? getUserByRole(Role role) {
    for (User user in users) {
      if (role == user.userRole) {
        return user;
      }
    }

    throw Exception("User not found in this $role");
  }

  User? _findUserOrNull(id) {
    for (User user in users) {
      if (id == user.userId) {
        return user;
      }
      return null;
    }
    return null;
  }

  bool _emailExists(String email) {
    for (User user in users) {
      if (email == user.userEmail) {
        return true;
      }
    }

    return false;
  }
}
