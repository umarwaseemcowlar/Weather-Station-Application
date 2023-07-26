import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_station_app/app/themes/colors.dart';

Widget buildWeatherPanel() {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
    child: Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primaryPurpleLight.withOpacity(0.8), // Set the opacity to control the glass effect
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 2, width: 50, color: Colors.grey),
        ],
      ),
    ),
  );
}
