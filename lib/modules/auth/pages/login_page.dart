import 'package:flutter/material.dart';
import 'package:passcontainer/modules/auth/controllers/auth_controller.dart';
import 'package:passcontainer/modules/auth/states/button_state.dart';
import 'package:passcontainer/utils/validators_util.dart';

import '../../../components/buttons/app_button.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_style.dart';

class LoginPage extends StatefulWidget {
  final AuthController controller;

  const LoginPage({
    super.key,
    required this.controller,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: AppColors.contrastColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'PassContainer',
                  style: AppTextStyle.h1,
                ),
                const SizedBox(height: 16),
                Text(
                  'Login',
                  style: AppTextStyle.bold,
                ),
                const SizedBox(height: 4),
                Text(
                  'Faça login ou cadastre-se para continuar',
                  style: AppTextStyle.subtitle,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                    label: Text('E-mail'),
                  ),
                  validator: ValidatorsUtil.emailValidator,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                    label: Text('Senha'),
                  ),
                  validator: ValidatorsUtil.noNullable,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Esqueceu sua senha?'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder(
                  valueListenable: widget.controller.buttonState,
                  builder: (context, state, _) {
                    return AppButton(
                      text: 'Login',
                      isLoading: state is LoadingState,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.controller.doLogin(
                            email: _emailController.text,
                            password: _passwordController.text,
                            onSuccess: () =>
                                Navigator.of(context).pushNamedAndRemoveUntil(
                              '/home',
                              (_) => false,
                            ),
                            onError: (String message) {},
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
