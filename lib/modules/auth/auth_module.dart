import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';
import 'package:passcontainer/modules/auth/pages/login_page.dart';

class AuthModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage =>
      (context) => const LoginPage();

  @override
  List<Bind> get moduleBinds => [

  ];

  @override
  String get moduleRoute => '/auth';

  @override
  Map<String, dynamic> get routes => {};
}
