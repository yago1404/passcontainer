import 'package:flutter/material.dart';
import 'package:passcontainer/components/cards/password_category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
              )
            ],
          ),
        ),
      ),
    );
  }
}
