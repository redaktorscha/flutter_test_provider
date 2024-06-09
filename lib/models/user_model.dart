import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  User(this.name);
}

class UserModel extends StateNotifier<User> {
  UserModel() : super(User(''));

  Future<void> fetchUser() async {
    await Future.delayed(const Duration(seconds: 1));
    state = User('Masha');
  }
}

final userProvider =
    StateNotifierProvider<UserModel, User>((ref) => UserModel());
