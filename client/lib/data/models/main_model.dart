class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'],
      feelsLike: map['feels_like'],
      tempMin: map['temp_min'],
      tempMax: map['temp_max'],
      pressure: map['pressure'],
      humidity: map['humidity'],
    );
  }

  @override
  String toString() {
    return 'Main{temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity}';
  }
}
