class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'],
      deg: map['deg'],
      gust: map['gust'],
    );
  }

  @override
  String toString() {
    return 'Wind{speed: $speed, deg: $deg, gust: $gust}';
  }
}
