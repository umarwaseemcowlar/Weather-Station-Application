class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['country'] = country;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      type: map['type'],
      id: map['id'],
      country: map['country'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
    );
  }

  @override
  String toString() {
    return 'Sys{type: $type, id: $id, country: $country, sunrise: $sunrise, sunset: $sunset}';
  }
}
