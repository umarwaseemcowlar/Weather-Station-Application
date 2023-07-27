import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/data/models/weather_data_model.dart';
import 'package:weather_station_app/data/repository/weather_repository.dart';
import 'package:weather_station_app/global/utils/geo_locator.dart';
import 'package:weather_station_app/global/utils/logger.dart';

class WeatherScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingWeatherForCity = false.obs;

  Rx<WeatherDataModel?> weatherData = WeatherDataModel().obs;
  RxList<WeatherDataModel> weatherDataList = <WeatherDataModel>[].obs;

  Rx<TextEditingController> cityController = TextEditingController().obs;

  @override
  void onReady() {
    super.onReady();
    getWeatherForCurrentPosition();
  }

  Future<void> getWeatherForCurrentPosition() async {
    isLoading.value = true;
    final Position location = await GeoLocatorUtility.determineCurrentPosition();

    if (location == null) {
      Logger.error("getWeatherForCurrentPosition(): Location is null");
      isLoading.value = false;
      return;
    }

    weatherData.value = (await WeatherRepository.getWeatherData(
          latitude: location.latitude.toString(),
          longitude: location.longitude.toString(),
        )) ??
        WeatherDataModel();

    Logger.success("getWeatherByCity(): Weather Data: ${weatherData.value.toString()}");
    isLoading.value = false;
  }

  Future<void> searchWeatherForACity() async {
    isLoadingWeatherForCity.value = true;

    final Position? location = await GeoLocatorUtility.getCoordinatesFromCityName(cityController.value.text);

    if (location == null) {
      Logger.error("getWeatherByCity(): Location is null");
      isLoadingWeatherForCity.value = false;
      return;
    }

    weatherData.value = (await WeatherRepository.getWeatherData(
          latitude: location.latitude.toString(),
          longitude: location.longitude.toString(),
        )) ??
        WeatherDataModel();

    Logger.success("getWeatherByCity(): Weather Data: ${weatherData.value.toString()}");
    isLoadingWeatherForCity.value = false;
  }
}
