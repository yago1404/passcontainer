import 'package:flutter/cupertino.dart';
import 'package:passcontainer/data/models/errors/http_errors.dart';
import 'package:passcontainer/modules/auth/states/button_state.dart';
import 'package:passcontainer/utils/app_storage.dart';

import '../../../data/models/user.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/stores/app_store.dart';

class AuthController {
  final UserRepository repository;
  final AppStorage storage;
  final AppStore store;

  AuthController({
    required this.repository,
    required this.storage,
    required this.store,
  });

  final ValueNotifier<ButtonState> _buttonState = ValueNotifier(
    InitialState(),
  );

  ValueNotifier<ButtonState> get buttonState => _buttonState;

  Future<void> doLogin({
    required String email,
    required String password,
    required void Function() onSuccess,
    required void Function(String message) onError,
  }) async {
    _buttonState.value = LoadingState();
    try {
      String token, refresh;
      User user;
      (user, token, refresh) = await repository.doLogin(
        email: email,
        password: password,
      );
      await Future.delayed(const Duration(seconds: 2));
      storage.setByKey('token', token);
      storage.setByKey(
        'refresh-token',
        refresh,
      );

      store.user = user;
      onSuccess();
    } on HttpError catch (e) {
      onError(e.message);
    } on Exception catch (_) {
      onError('Um erro desconhecido aconteceu, tente novamente em instantes');
    }
    _buttonState.value = InitialState();
  }
}
