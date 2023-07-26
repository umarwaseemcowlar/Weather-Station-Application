import 'package:flutter/material.dart';
import 'package:weather_station_app/app/themes/fonts.dart';

class AppTextTheme {
  static const textTheme = TextTheme(
    displaySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: Colors.white,
      fontFamily: AppFonts.montserrat,
    ),
    displayMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontFamily: AppFonts.montserrat,
    ),
    displayLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: AppFonts.montserrat,
    ),
    headlineLarge: TextStyle(
      fontSize: 100,
      fontWeight: FontWeight.w200,
      color: Colors.white,
      fontFamily: AppFonts.montserrat,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: AppFonts.montserrat,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: AppFonts.montserrat,
    ),
  );
}
