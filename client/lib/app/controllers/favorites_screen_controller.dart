import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/data/models/weather_data_model.dart';
import 'package:weather_station_app/data/repository/weather_repository.dart';
import 'package:weather_station_app/global/utils/geo_locator.dart';
import 'package:weather_station_app/global/utils/logger.dart';

class FavoritesScreenController extends GetxController {
  RxList<WeatherDataModel> weatherDataList = <WeatherDataModel>[].obs;

  @override
  void onInit() {
    // get all the favorite weather data from the database
    super.onInit();
  }

  Rx<TextEditingController> cityController = TextEditingController().obs;
  RxBool isLoading = false.obs;

  Future<void> addFavoriteWeather() async {
    isLoading.value = true;

    if (cityController.value.text.isEmpty) {
      Logger.error("addFavoriteWeather(): City name is empty");
      Fluttertoast.showToast(msg: "Enter a city name", backgroundColor: Colors.red);
      isLoading.value = false;
      return;
    }

    if (weatherDataList.any((element) => element.name?.toLowerCase() == cityController.value.text.toLowerCase())) {
      Logger.error("addFavoriteWeather(): City already exists");
      Fluttertoast.showToast(msg: "City already exists", backgroundColor: Colors.red);
      isLoading.value = false;
      return;
    }

    final Rx<WeatherDataModel?> weatherData = WeatherDataModel().obs;

    final Position? location = await GeoLocatorUtility.getCoordinatesFromCityName(cityController.value.text);

    if (location == null) {
      Logger.error("addFavoriteWeather(): Location is null");
      isLoading.value = false;
      return;
    }

    weatherData.value = (await WeatherRepository.getWeatherData(
      latitude: location.latitude.toString(),
      longitude: location.longitude.toString(),
    ));

    if (weatherData.value != null) {
      weatherDataList.add(weatherData.value!);
    } else {
      Logger.error("addFavoriteWeather(): Weather Data is null");
      Fluttertoast.showToast(msg: "Could not add favorite city", backgroundColor: Colors.red);
    }

    Logger.success("addFavoriteWeather(): Weather Data: ${weatherData.value.toString()}");
    isLoading.value = false;
  }
}
