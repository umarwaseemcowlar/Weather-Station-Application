extension Temperature on double {
  String farenheitToCelcius() {
    return (this - 273.15).toStringAsFixed(0);
  }

  String kelvinToCelcius() {
    return (this - 273.15).toStringAsFixed(1);
  }
}
