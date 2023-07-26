import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:weather_station_app/global/utils/logger.dart';
import "package:http/http.dart" as http;

class ApiRequestHandler {
  static Future<dynamic> getRequest(String requestUrl, dynamic headers) async {
    try {
      const timeoutSeconds = 10;

      Logger.info("getRequest(): Request URL: $requestUrl");
      Logger.info("getRequest(): Request Headers: $headers");

      final response = await http
          .get(Uri.parse(requestUrl), headers: headers)
          .timeout(const Duration(seconds: timeoutSeconds), onTimeout: _whenRequestTimesOut);

      Logger.info("getRequest(): Response: ${response.body}");
      return _validateRequestResponse(response);
    } catch (e) {
      Logger.error("getRequest(): Error: $e");
      return null;
    }
  }

  static Future<dynamic> postRequest(String requestUrl, dynamic headers, dynamic data) async {
    try {
      const timeoutSeconds = 10;

      Logger.info("postRequest(): Request URL: $requestUrl");
      Logger.info("getRequest(): Request Headers: $headers");

      final response = await http
          .post(Uri.parse(requestUrl), headers: headers, body: data)
          .timeout(const Duration(seconds: timeoutSeconds), onTimeout: _whenRequestTimesOut);

      Logger.info("postRequest(): Response: ${response.body}");
      return _validateRequestResponse(response);
    } catch (e) {
      Logger.error("postRequest(): Error: $e");
      return null;
    }
  }

  static FutureOr<http.Response> _whenRequestTimesOut() {
    throw TimeoutException("The connection has timed out, Please try again!");
  }

  static dynamic _validateRequestResponse(http.Response response) {
    final decodedResponse = jsonDecode(response.body);
    // status code 200
    if (response.statusCode == HttpStatus.ok) {
      return decodedResponse;
    } else {
      if (decodedResponse["error"] != null) {
        throw Exception(decodedResponse["error"]);
      }
      throw Exception("Something went wrong!");
    }
  }
}
