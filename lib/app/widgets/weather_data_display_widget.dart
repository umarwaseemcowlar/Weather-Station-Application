import 'package:flutter/material.dart';

class WeatherDataDisplayWidget extends StatefulWidget {
  const WeatherDataDisplayWidget(
      {super.key,
      required this.cityName,
      required this.temperature,
      required this.weatherDescription,
      required this.humidity,
      required this.wind});

  final String cityName;
  final String temperature;
  final String weatherDescription;
  final String humidity;
  final String wind;

  @override
  State<WeatherDataDisplayWidget> createState() => _WeatherDataDisplayWidgetState();
}

class _WeatherDataDisplayWidgetState extends State<WeatherDataDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.cityName, style: Theme.of(context).textTheme.displayLarge),
        Text(widget.temperature, style: Theme.of(context).textTheme.headlineLarge),
        Text(widget.weatherDescription, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // humidity
            Text(widget.humidity, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
            const SizedBox(width: 20),
            Text(widget.wind, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
