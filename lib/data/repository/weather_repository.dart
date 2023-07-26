import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/data/models/weather_data_model.dart';
import 'package:weather_station_app/data/services/api/api_request_handler.dart';
import 'package:weather_station_app/global/constants/request_type_enum.dart';
import 'package:weather_station_app/global/utils/configs.dart';
import 'package:weather_station_app/global/utils/logger.dart';

class WeatherRepository {
  static final Configs _configs = Get.find<Configs>();

  static Future<WeatherDataModel?>? getWeatherData({required String latitude, required String longitude}) async {
    final String requestUrl = _configs.getUrl(
      RequestType.thirdParty,
      {"lat": latitude, "lon": longitude},
    );

    final dynamic response = await ApiRequestHandler.getRequest(requestUrl, null);

    if (response != null) {
      var weatherDataModel = WeatherDataModel.fromMap(response);
      Logger.info("WeatherRepository.getWeatherData(): Response: $response");
      Fluttertoast.showToast(msg: "Fetched weather data for ${weatherDataModel.name}", backgroundColor: Colors.green);
      return weatherDataModel;
    } else {
      Logger.error("WeatherRepository.getWeatherData(): Error Response: $response");
      Fluttertoast.showToast(msg: "Failed to get weather data", backgroundColor: Colors.red);
      // throw Exception("Failed to get weather data");
      return null;
    }
  }
}
