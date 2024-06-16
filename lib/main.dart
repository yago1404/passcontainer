import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';
import 'package:passcontainer/modules/auth/auth_module.dart';
import 'package:passcontainer/modules/home/home_module.dart';
import 'package:passcontainer/theme/app_theme.dart';

import 'app_binds.dart';
import 'utils/app_storage.dart';

void main() async {
  await AppStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialModule(
      initialBinds: appBinds,
      modules: [
        HomeModule(),
        AuthModule(),
      ],
      materialApp: MaterialApp(
        initialRoute: '/auth',
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
