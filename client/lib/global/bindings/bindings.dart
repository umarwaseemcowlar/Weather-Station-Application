import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/app/controllers/favorites_screen_controller.dart';
import 'package:weather_station_app/app/controllers/weather_controller.dart';
import 'package:weather_station_app/global/utils/configs.dart';

class MyBindings {
  static void initialize() {
    WidgetsFlutterBinding.ensureInitialized();
    Configs configs = Get.put(Configs());
    configs.initializeConfigs();
    Get.put(WeatherScreenController());
    Get.put(FavoritesScreenController());
  }

  static void destroy() {
    Get.delete<Configs>();
  }
}
