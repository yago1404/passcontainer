import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle get h1 => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700
  );

  static TextStyle get subtitle => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static TextStyle get bold => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}