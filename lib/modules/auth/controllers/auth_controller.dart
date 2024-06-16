import 'package:passcontainer/utils/app_storage.dart';

import '../../../data/models/user.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/stores/app_store.dart';

class AuthController {
  final UserRepository repository;
  final AppStorage storage;
  final AppStore store;

  const AuthController({
    required this.repository,
    required this.storage,
    required this.store,
  });

  Future<void> doLogin({
    required String email,
    required String password,
  }) async {
    String token, refresh;
    User user;
    (user, token, refresh) = await repository.doLogin(
      email: email,
      password: password,
    );
    storage.setByKey('token', token);
    storage.setByKey(
      'refresh-token',
      refresh,
    );

    store.user = user;
  }
}
