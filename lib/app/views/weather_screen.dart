import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_station_app/app/controllers/weather_controller.dart';
import 'package:weather_station_app/app/themes/colors.dart';
import 'package:weather_station_app/app/widgets/app_bar_widget.dart';
import 'package:weather_station_app/app/widgets/app_drawer.dart';
import 'package:weather_station_app/global/common/animation_widget.dart';
import 'package:weather_station_app/global/constants/images_handler.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherScreenController>(builder: (weatherScreenController) {
      return Scaffold(
        backgroundColor: AppColors.primaryPurpleLight,
        drawer: const AppDrawerWidget(),
        body: RefreshIndicator(
          onRefresh: () async {
            await weatherScreenController.getWeatherForCurrentPosition();
          },
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (_panelController.isPanelOpen) {
                    _panelController.close();
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageHandler.nightImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        getAppBar(context),
                        const SizedBox(height: 20),
                        Text(weatherScreenController.cityName.value, style: Theme.of(context).textTheme.displayLarge),
                        Text("${weatherScreenController.temperature.value}°", style: Theme.of(context).textTheme.headlineLarge),
                        Text(weatherScreenController.weatherDescription.value.toUpperCase(),
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Humidity: 50%", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
                            const SizedBox(width: 20),
                            Text("Wind: 10 km/h", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SlideAnimationWidget(
                          delay: 0.5,
                          child: Image.asset(ImageHandler.houseImage),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlidingUpPanel(
                color: Colors.transparent,
                panelBuilder: (scrollController) => buildWeatherPanel(),
                minHeight: 250, // Set the minimum height of the sliding panel
                controller: _panelController, // If you want to control the panel manually
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildWeatherPanel() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.primaryPurpleLight.withOpacity(0.8), // Set the opacity to control the glass effect
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 2, width: 50, color: Colors.grey),
            ],
          )),
    );
  }
}
