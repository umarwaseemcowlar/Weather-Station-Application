import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_station_app/global/utils/logger.dart';

class GeoLocatorUtility {
  static Future<Position> determineCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "Location services are disabled.");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "Location permissions are denied");
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Fluttertoast.showToast(msg: "Location permissions are permanently denied, we cannot request permissions.");
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  // determine coordinates by city name
  static Future<Position?> getCoordinatesFromCityName(String cityName) async {
    try {
      List<Location> locations = await locationFromAddress(cityName);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        Logger.info('getCoordinatesFromCityName(): Location for $cityName: ${location.latitude}, ${location.longitude}');
        return Position(
          latitude: location.latitude,
          longitude: location.longitude,
          accuracy: 0.0,
          altitude: 0.0,
          heading: 0.0,
          speed: 0.0,
          speedAccuracy: 0.0,
          timestamp: DateTime.now(),
        );
      } else {
        return null;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "An error occured while fetching $cityName data",
        backgroundColor: Colors.red,
      );
      Logger.error('Error getting coordinates: $e');
      return null;
    }
  }
}
