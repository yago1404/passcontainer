import 'package:flutter/material.dart';
import 'package:module_navigator/module_navigator.dart';
import 'package:passcontainer/data/repositories/password_repository.dart';
import 'package:passcontainer/modules/home/home_module.dart';

import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialModule(
      initialBinds: [
        Bind<PasswordRepository>(
          (_) => PasswordRepository(),
        ),
      ],
      modules: [
        HomeModule(),
      ],
      materialApp: MaterialApp(
        initialRoute: '/home',
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
