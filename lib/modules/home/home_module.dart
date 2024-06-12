import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';

import 'pages/home_page.dart';

class HomeModule implements Module {
  @override
  Widget Function(BuildContext context) get initialPage =>
      (_) => const HomePage();

  @override
  List<Bind> get moduleBinds => [];

  @override
  String get moduleRoute => '/home';

  @override
  Map<String, dynamic> get routes => {};
}
