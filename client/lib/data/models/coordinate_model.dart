class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lon: map['lon'],
      lat: map['lat'],
    );
  }

  @override
  String toString() {
    return 'Coord{lon: $lon, lat: $lat}';
  }
}
