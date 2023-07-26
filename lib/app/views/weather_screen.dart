// Path: lib/app/views/weather_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/app/controllers/weather_controller.dart';

class WeatherScreen extends GetView<WeatherScreenController> {
  const WeatherScreen({Key? key}) : super(key: key);

  final String cityName = "India";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Location: $cityName",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Cloud PCT: ${controller.weatherData.value?.cloudPct.toString()}",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Humidity: ${controller.weatherData.value?.humidity.toString()}",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Min Temperature: ${controller.weatherData.value?.minTemp.toString()}",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Max Temperature: ${controller.weatherData.value?.maxTemp.toString()}",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Wind Speed: ${controller.weatherData.value?.windSpeed.toString()}",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Wind Degrees: ${controller.weatherData.value?.windDegrees.toString()}",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Sunrise: ${controller.weatherData.value?.sunrise.toString()}",
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Sunset: ${controller.weatherData.value?.sunset.toString()}",
                    style: const TextStyle(fontSize: 30),
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getWeatherByCity(cityName);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
