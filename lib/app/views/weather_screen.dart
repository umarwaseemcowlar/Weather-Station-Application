// Path: lib/app/views/weather_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/app/controllers/weather_controller.dart';
import 'package:weather_station_app/app/themes/colors.dart';
import 'package:weather_station_app/app/widgets/app_bar_widget.dart';
import 'package:weather_station_app/app/widgets/app_drawer.dart';
import 'package:weather_station_app/global/common/animation_widget.dart';
import 'package:weather_station_app/global/constants/images_handler.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherScreenController>(builder: (weatherScreenController) {
      return Scaffold(
        backgroundColor: AppColors.primaryPurpleLight,
        drawer: const AppDrawerWidget(),
        body: Container(
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
                Text("19°", style: Theme.of(context).textTheme.headlineLarge),
                Text("Mostly Clear", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
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
                // buildWeatherPanel(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
