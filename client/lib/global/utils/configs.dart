import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:weather_station_app/global/utils/logger.dart";

import "../constants/request_type_enum.dart";

// can be used in a singleton manner using Get.put(Configs())

class Configs {
  String? weatherApiBaseUrl;
  String? weatherApiKey;

  // loads .env file and initializes the configs
  Future<void> initializeConfigs() async {
    try {
      await dotenv.load(fileName: ".env");

      weatherApiBaseUrl = dotenv.env['API_BASE_URL'];
      Logger.info("initializeConfigs(): weatherApiBaseUrl: $weatherApiBaseUrl");

      weatherApiKey = dotenv.env['API_KEY'];
      Logger.info("initializeConfigs(): weatherApiKey: $weatherApiKey");
    } catch (e) {
      Logger.error("initializeConfigs(): Failed to load .env file");
    }
  }

  String getUrl(RequestType requestType, Map<String, String> params) {
    switch (requestType) {
      case RequestType.thirdParty:
        String thirdPartyUrl = "$weatherApiBaseUrl";
        if (params.isNotEmpty) {
          thirdPartyUrl += "?";
          params.forEach((key, value) {
            thirdPartyUrl += "$key=$value&";
          });
          thirdPartyUrl += "appid=$weatherApiKey";
        }
        return thirdPartyUrl;
      default:
        return "";
    }
  }

  // Map<String, String> getHeaders(RequestType requestType) {
  //   switch (requestType) {
  //     case RequestType.thirdParty:
  //       return {ß
  //         "X-RapidAPI-Key": weatherApiKey!,
  //         "X-RapidAPI-Host": weatherApiHost!,
  //       };
  //     case RequestType.myServer:
  //       return {};
  //   }
  // }
}
