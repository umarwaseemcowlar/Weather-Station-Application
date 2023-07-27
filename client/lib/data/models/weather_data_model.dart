import 'package:weather_station_app/data/models/clouds_model.dart';
import 'package:weather_station_app/data/models/coordinate_model.dart';
import 'package:weather_station_app/data/models/main_model.dart';
import 'package:weather_station_app/data/models/sys_model.dart';

import 'package:weather_station_app/data/models/weather_model.dart';
import 'package:weather_station_app/data/models/wind_model.dart';

class WeatherDataModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherDataModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  WeatherDataModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }

  factory WeatherDataModel.fromMap(Map<String, dynamic> map) {
    return WeatherDataModel(
      coord: map['coord'] != null ? Coord.fromMap(map['coord']) : null,
      weather: map['weather'] != null ? List<Weather>.from(map['weather'].map((v) => Weather.fromMap(v))) : null,
      base: map['base'],
      main: map['main'] != null ? Main.fromMap(map['main']) : null,
      visibility: map['visibility'],
      wind: map['wind'] != null ? Wind.fromMap(map['wind']) : null,
      clouds: map['clouds'] != null ? Clouds.fromMap(map['clouds']) : null,
      dt: map['dt'],
      sys: map['sys'] != null ? Sys.fromMap(map['sys']) : null,
      timezone: map['timezone'],
      id: map['id'],
      name: map['name'],
      cod: map['cod'],
    );
  }

  @override
  String toString() {
    return 'WeatherDataModel{coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod}';
  }
}
