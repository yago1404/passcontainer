import 'package:flutter/material.dart';
import 'package:passcontainer/data/repositories/password_repository.dart';

import '../states/home_state.dart';

class HomeController {
  final PasswordRepository passwordRepository;

  HomeController({required this.passwordRepository});

  final ValueNotifier<HomeState> _state = ValueNotifier(HomeInitial());

  HomeState get state => _state.value;

  Future<void> loadRecent() async {
    await passwordRepository.findRecent();
  }
}