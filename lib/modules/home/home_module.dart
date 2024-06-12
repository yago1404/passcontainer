import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';
import 'package:passcontainer/data/repositories/password_repository.dart';
import 'package:passcontainer/modules/home/controllers/home_controller.dart';

import 'pages/home_page.dart';

class HomeModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage =>
      (context) => HomePage(
            controller: HomeController(
              passwordRepository: context.get<PasswordRepository>(),
            ),
          );

  @override
  List<Bind> get moduleBinds => [];

  @override
  String get moduleRoute => '/home';

  @override
  Map<String, dynamic> get routes => {};
}
