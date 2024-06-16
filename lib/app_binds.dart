import 'package:hive/hive.dart';
import 'package:module_navigator/module_navigator.dart';
import 'package:passcontainer/data/stores/app_store.dart';
import 'package:passcontainer/utils/app_storage.dart';

import 'data/repositories/password_repository.dart';
import 'data/repositories/user_repository.dart';
import 'data/services/rest_service.dart';

List<Bind> appBinds = [
  Bind<Box>(
    (_) => Hive.box('passcontainer'),
  ),
  Bind<AppStore>(
    (_) => AppStore(),
  ),
  Bind<AppStorage>(
    (context) => AppStorage(
      context.get<Box>(),
    ),
  ),
  Bind<RestService>(
    (context) => RestService(
      storage: context.get<AppStorage>(),
    ),
  ),
  Bind<PasswordRepository>(
    (_) => PasswordRepository(),
  ),
  Bind<UserRepository>(
    (context) => UserRepository(
      service: context.get<RestService>(),
    ),
  ),
];
