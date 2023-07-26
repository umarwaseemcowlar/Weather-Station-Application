import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/app/routes/app_routes.dart';
import 'package:weather_station_app/app/themes/colors.dart';
import 'package:weather_station_app/app/themes/text_theme.dart';

class AppStartingPoint extends StatelessWidget {
  const AppStartingPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTextTheme.textTheme,
        colorScheme: AppColors.colorScheme,
      ),
      initialRoute: AppRoutes.weatherScreen,
      getPages: AppRoutes.getAppRoutes,
    );
  }
}
