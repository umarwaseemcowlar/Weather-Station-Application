import 'package:flutter/material.dart';

class WeatherCardWidget extends StatefulWidget {
  const WeatherCardWidget({
    super.key,
    required this.temperature,
    required this.cityName,
    required this.weatherDescription,
    required this.humidity,
    required this.wind,
    required this.image,
  });

  final String temperature;
  final String cityName;
  final String weatherDescription;
  final String humidity;
  final String wind;
  final String image;

  @override
  State<WeatherCardWidget> createState() => _WeatherCardWidgetState();
}

class _WeatherCardWidgetState extends State<WeatherCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.temperature}°",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 50, color: Colors.white),
              ),
              const SizedBox(height: 30),
              Text(
                "H: ${widget.humidity}%  W:${widget.wind}km/h",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
              ),
              // const SizedBox(height: 10),
              Text(
                widget.cityName,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                widget.image,
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 10),
              Text(
                widget.weatherDescription,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
