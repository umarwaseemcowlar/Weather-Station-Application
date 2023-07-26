// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// cloud_pct:40
// temp:19
// feels_like:19
// humidity:69
// min_temp:18
// max_temp:21
// wind_speed:4.63
// wind_degrees:220
// sunrise:1690288674
// sunset:1690343609

class WeatherModel {
  final int? cloudPct;
  final int? temp;
  final int? feelsLike;
  final int? humidity;
  final int? minTemp;
  final int? maxTemp;
  final num? windSpeed;
  final int? windDegrees;
  final int? sunrise;
  final int? sunset;

  WeatherModel({
    this.cloudPct,
    this.temp,
    this.feelsLike,
    this.humidity,
    this.minTemp,
    this.maxTemp,
    this.windSpeed,
    this.windDegrees,
    this.sunrise,
    this.sunset,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cloud_pct': cloudPct,
      'temp': temp,
      'feels_like': feelsLike,
      'humidity': humidity,
      'min_temp': minTemp,
      'max_temp': maxTemp,
      'wind_speed': windSpeed,
      'wind_degrees': windDegrees,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      cloudPct: map['cloud_pct'] as int?,
      temp: map['temp'] as int?,
      feelsLike: map['feels_like'] as int?,
      humidity: map['humidity'] as int?,
      minTemp: map['min_temp'] as int?,
      maxTemp: map['max_temp'] as int?,
      windSpeed: map['wind_speed'] as num?,
      windDegrees: map['wind_degrees'] as int?,
      sunrise: map['sunrise'] as int?,
      sunset: map['sunset'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(cloudPct: $cloudPct, temp: $temp, feelsLike: $feelsLike, humidity: $humidity, minTemp: $minTemp, maxTemp: $maxTemp, windSpeed: $windSpeed, windDegrees: $windDegrees, sunrise: $sunrise, sunset: $sunset)';
  }
}
