import 'package:flutter/material.dart';

class AppColors {
  static const primaryPurple = Color.fromRGBO(196, 0, 255, 1);
  static const primaryPurpleLight = Color.fromRGBO(90, 81, 119, 1);

  static const ColorScheme colorScheme = ColorScheme.light(
    primary: AppColors.primaryPurpleLight,
    secondary: AppColors.primaryPurple,
  );
}
