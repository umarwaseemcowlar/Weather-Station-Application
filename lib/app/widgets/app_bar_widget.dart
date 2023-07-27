import 'package:flutter/material.dart';
import 'package:weather_station_app/app/controllers/weather_controller.dart';
import 'package:weather_station_app/global/common/custom_text_field.dart';

AppBar getAppBar(BuildContext context, WeatherScreenController controller) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    title: CustomTextField(
      textEditingController: controller.cityController.value,
      icon: Icons.search,
      onPressTrigger: controller.searchWeatherForACity,
      isLoading: controller.isLoadingWeatherForCity.value,
    ),
    actions: [
      IconButton(
        onPressed: controller.getWeatherForCurrentPosition,
        icon: controller.isLoading.value ? const CircularProgressIndicator() : const Icon(Icons.location_on),
      ),
    ],
  );
}
