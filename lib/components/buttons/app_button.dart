import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final bool isLoading;
  late final Color backgroundColor;
  late final Color textColor;
  late final Color borderColor;
  late final FontWeight fontWeight;

  AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.isLoading = false,
  }) {
    backgroundColor = AppColors.primaryColor;
    textColor = Colors.white;
    borderColor = AppColors.primaryColor;
    fontWeight = FontWeight.bold;
  }

  AppButton.secondary({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.isLoading = false,
  }) {
    backgroundColor = Colors.transparent;
    textColor = AppColors.primaryColor;
    borderColor = AppColors.primaryColor;
    fontWeight = FontWeight.bold;
  }

  AppButton.tertiary({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.isLoading = false,
  }) {
    backgroundColor = Colors.transparent;
    textColor = AppColors.primaryColor;
    borderColor = Colors.transparent;
    fontWeight = FontWeight.bold;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? () {} : onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          color: backgroundColor,
        ),
        child: isLoading
            ? const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 23,
              width: 23,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ),
          ],
        )
            : Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}