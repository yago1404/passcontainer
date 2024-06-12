import 'package:flutter/material.dart';
import 'package:passcontainer/theme/app_colors.dart';

class PasscontainerIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;

  const PasscontainerIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.contrastColor,
        ),
        child: Icon(icon),
      ),
    );
  }
}
