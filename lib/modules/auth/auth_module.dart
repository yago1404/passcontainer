import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';
import 'package:passcontainer/data/repositories/user_repository.dart';
import 'package:passcontainer/modules/auth/controllers/auth_controller.dart';
import 'package:passcontainer/modules/auth/pages/login_page.dart';

import '../../data/stores/app_store.dart';
import '../../utils/app_storage.dart';

class AuthModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage =>
      (context) => LoginPage(
        controller: context.get<AuthController>(),
      );

  @override
  List<Bind> get moduleBinds => [
        Bind<AuthController>(
          (context) => AuthController(
            repository: context.get<UserRepository>(),
            storage: context.get<AppStorage>(),
            store: context.get<AppStore>(),
          ),
        ),
      ];

  @override
  String get moduleRoute => '/auth';

  @override
  Map<String, dynamic> get routes => {};
}
