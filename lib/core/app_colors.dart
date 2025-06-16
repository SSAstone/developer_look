import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color grey = Color(0xFFF2F4F8);
  static const Color lightColor = Color(0xFFF4F1EB);
  static const Color darkColor = Color(0xFF141414);
  static const Color textBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color bgDark = Color(0xFF050A26);
  static const Color bgLight = Color.fromARGB(255, 229, 235, 238);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF232323);

  static final Random random = Random();

  static Color getRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  static Gradient bgDarkGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 67, 12, 134),
      Color.fromARGB(255, 23, 28, 51),
    ],
  );
}
