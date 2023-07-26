import 'package:flutter/material.dart';
import 'package:weather_station_app/app.dart';
import 'package:weather_station_app/global/bindings/bindings.dart';

void main() {
  MyBindings.initialize();
  runApp(const AppStartingPoint());
}
