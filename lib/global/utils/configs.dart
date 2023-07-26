import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:weather_station_app/global/utils/logger.dart";

import "../constants/request_type_enum.dart";

// can be used in a singleton manner using Get.put(Configs())

class Configs {
  String? weatherApiBaseUrl;
  String? weatherApiKey;
  String? weatherApiHost;

  String? serverApiBaseUrl;

  // loads .env file and initializes the configs
  Future<void> initializeConfigs() async {
    try {
      await dotenv.load(fileName: ".env");

      weatherApiBaseUrl = dotenv.env['API_BASE_URL'];
      Logger.info("initializeConfigs(): weatherApiBaseUrl: $weatherApiBaseUrl");

      weatherApiKey = dotenv.env['API_KEY'];
      Logger.info("initializeConfigs(): weatherApiKey: $weatherApiKey");

      weatherApiHost = dotenv.env['API_HOST'];
      Logger.info("initializeConfigs(): weatherApiHost: $weatherApiHost");

      serverApiBaseUrl = dotenv.env['SERVER_API_BASE_URL'];
      Logger.info("initializeConfigs(): serverApiBaseUrl: $serverApiBaseUrl");
    } catch (e) {
      Logger.error("initializeConfigs(): Failed to load .env file");
    }
  }

  String getUrl(
      RequestType requestType, String endPoint, Map<String, String> params) {
    switch (requestType) {
      case RequestType.thirdParty:
        String thirdPartyUrl = "$weatherApiBaseUrl$endPoint";
        if (params.isNotEmpty) {
          thirdPartyUrl += "?";
          params.forEach((key, value) {
            thirdPartyUrl += "$key=$value&";
          });
          thirdPartyUrl = thirdPartyUrl.substring(0, thirdPartyUrl.length - 1);
        }
        return thirdPartyUrl;
      case RequestType.myServer:
        return "$serverApiBaseUrl$endPoint";
      default:
        return "";
    }
  }

  Map<String, String> getHeaders(RequestType requestType) {
    switch (requestType) {
      case RequestType.thirdParty:
        return {
          "X-RapidAPI-Key": weatherApiKey!,
          "X-RapidAPI-Host": weatherApiHost!,
        };
      case RequestType.myServer:
        return {};
    }
  }
}
