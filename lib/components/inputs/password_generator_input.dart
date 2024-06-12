import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passcontainer/components/buttons/passcontainer_icon_button.dart';

class PasswordGeneratorInput extends StatefulWidget {
  const PasswordGeneratorInput({super.key});

  @override
  State<PasswordGeneratorInput> createState() => _PasswordGeneratorInputState();
}

class _PasswordGeneratorInputState extends State<PasswordGeneratorInput> {
  String password = '';
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@#\$%¨&*()';
  final Random _rnd = Random();

  String get getRandomString => String.fromCharCodes(
        Iterable.generate(
          20,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );

  @override
  void initState() {
    password = getRandomString;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PasscontainerIconButton(
          icon: Icons.copy,
          onTap: () {
            Clipboard.setData(ClipboardData(text: password));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Senha copiada para área de transferência'),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        PasscontainerIconButton(
          icon: Icons.refresh,
          onTap: () => setState(() {
            password = getRandomString;
          }),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            password,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
