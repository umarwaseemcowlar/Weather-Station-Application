import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/app/views/weather_screen.dart';

class AppStartingPoint extends StatelessWidget {
  const AppStartingPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: WeatherScreen());
  }
}
