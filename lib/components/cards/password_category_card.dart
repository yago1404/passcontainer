import 'package:flutter/material.dart';
import 'package:passcontainer/theme/app_colors.dart';

class PasswordCategoryCard extends StatelessWidget {
  final String title;
  final IconData trailingIcon;
  final int quantity;
  final void Function()? onTap;

  const PasswordCategoryCard({
    super.key,
    required this.title,
    required this.trailingIcon,
    required this.quantity,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.contrastColor,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 250) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(trailingIcon, size: 24),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$quantity senhas', style: const TextStyle(color: Colors.grey),),
                      const Icon(Icons.navigate_next, size: 20,)
                    ],
                  ),
                ],
              ),
            );
          }
          return ListTile(
            leading: Icon(trailingIcon),
            title: Text(title),
            subtitle: Text('$quantity senhas'),
            trailing: const Icon(Icons.navigate_next),
          );
        }),
      ),
    );
  }
}
