import 'package:flutter/material.dart';
import 'package:weather_station_app/app/controllers/weather_controller.dart';

AppBar getAppBar(BuildContext context, WeatherScreenController controller) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
    title: TextField(
      focusNode: FocusNode(),
      controller: controller.cityController.value,
      decoration: InputDecoration(
        suffixIcon: controller.isLoadingWeatherForCity.value
            ? SizedBox(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  strokeWidth: 1,
                ),
              )
            : IconButton(
                onPressed: controller.searchWeatherForACity,
                icon: const Icon(Icons.search),
              ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    ),
    actions: [
      IconButton(
        onPressed: controller.getWeatherForCurrentPosition,
        icon: const Icon(Icons.location_on),
      ),
    ],
  );
}
