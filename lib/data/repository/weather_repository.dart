import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/data/services/api/api_request_handler.dart';
import 'package:weather_station_app/global/constants/api_endpoints.dart';
import 'package:weather_station_app/global/constants/request_type_enum.dart';
import 'package:weather_station_app/global/utils/configs.dart';
import 'package:weather_station_app/global/utils/logger.dart';

import '../models/weather_model.dart';

class WeatherRepository {
  static final Configs _configs = Get.find<Configs>();

  static Future<WeatherModel?>? getWeatherData({required String cityName}) async {
    final String requestUrl = _configs.getUrl(RequestType.thirdParty, WeatherApiEndpoint.weather, {"city": cityName});
    final Map<String, String> headers = _configs.getHeaders(RequestType.thirdParty);

    final dynamic response = await ApiRequestHandler.getRequest(requestUrl, headers);

    if (response != null) {
      Logger.info("WeatherRepository.getWeatherData(): Response: $response");
      Fluttertoast.showToast(msg: "Fetched weather data for $cityName", backgroundColor: Colors.green);
      return WeatherModel.fromMap(response);
    } else {
      Logger.error("WeatherRepository.getWeatherData(): Error Response: $response");
      Fluttertoast.showToast(msg: "Failed to get weather data", backgroundColor: Colors.red);
      // throw Exception("Failed to get weather data");
      return null;
    }
  }
}
