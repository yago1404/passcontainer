import 'package:flutter/material.dart';

import '../models/user.dart';

class AppStore extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  set user(User? user) {
    _user = user;
    notifyListeners();
  }
}