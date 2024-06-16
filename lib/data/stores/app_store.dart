import '../models/user.dart';

class AppStore {
  User? _user;

  User? get user => _user;

  set user(User? user) {
    _user = user;
  }
}