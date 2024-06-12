import 'package:flutter/material.dart';
import 'package:passcontainer/components/cards/password_category_card.dart';
import 'package:passcontainer/components/inputs/password_generator_input.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 24),
          Icon(Icons.scanner),
          SizedBox(width: 24),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gerencie sua privacidade',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 24),
              const PasswordGeneratorInput(),
              const SizedBox(height: 24),
              const Text(
                'Grupos de senha',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 12),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 480) {
                    return Row(
                      children: [
                        Flexible(
                          child: PasswordCategoryCard(
                            title: 'Redes Sociais',
                            quantity: 35,
                            trailingIcon: Icons.people,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 14),
                        Flexible(
                          child: PasswordCategoryCard(
                            title: 'Bancos',
                            quantity: 2,
                            trailingIcon: Icons.attach_money,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 14),
                        Flexible(
                          child: PasswordCategoryCard(
                            title: 'Cartões',
                            quantity: 35,
                            trailingIcon: Icons.credit_card,
                            onTap: () {},
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      PasswordCategoryCard(
                        title: 'Redes Sociais',
                        quantity: 35,
                        trailingIcon: Icons.people,
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Flexible(
                            child: PasswordCategoryCard(
                              title: 'Bancos',
                              quantity: 2,
                              trailingIcon: Icons.attach_money,
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 14),
                          Flexible(
                            child: PasswordCategoryCard(
                              title: 'Cartões',
                              quantity: 35,
                              trailingIcon: Icons.credit_card,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Adicionados recentemente',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 12),
              const ListTile(
                leading: Icon(Icons.people),
                title: Text('Instagram'),
                subtitle: Text('****'),
                trailing: Icon(Icons.navigate_next_outlined),
              ),
              const ListTile(
                leading: Icon(Icons.attach_money),
                title: Text('NuBank'),
                subtitle: Text('****'),
                trailing: Icon(Icons.navigate_next_outlined),
              ),
              const ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Crédito NuBank'),
                subtitle: Text('Master'),
                trailing: Icon(Icons.navigate_next_outlined),
              ),
              const ListTile(
                leading: Icon(Icons.people),
                title: Text('Youtube'),
                subtitle: Text('****'),
                trailing: Icon(Icons.navigate_next_outlined),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
