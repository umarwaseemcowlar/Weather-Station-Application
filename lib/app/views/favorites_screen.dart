// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/app/controllers/favorites_screen_controller.dart';
import 'package:weather_station_app/app/widgets/weather_card_widget.dart';
import 'package:weather_station_app/global/common/custom_text_field.dart';
import 'package:weather_station_app/global/constants/images_handler.dart';
import 'package:weather_station_app/global/utils/temperature_extensions.dart';

class FavoritesScreen extends GetView<FavoritesScreenController> {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextField(
                    textEditingController: controller.cityController.value,
                    icon: Icons.add,
                    onPressTrigger: controller.addFavoriteWeather,
                    isLoading: controller.isLoading.value),
              ),
              (controller.weatherDataList.isEmpty)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "No favorites added yet",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.weatherDataList.length,
                      itemBuilder: (context, index) {
                        return WeatherCardWidget(
                          temperature: controller.weatherDataList.value[index].main?.temp!.farenheitToCelcius() ?? "",
                          cityName: controller.weatherDataList.value[index].name ?? "",
                          weatherDescription: controller.weatherDataList.value[index].weather?.first.description ?? "",
                          humidity: controller.weatherDataList.value[index].main?.humidity.toString() ?? "",
                          wind: controller.weatherDataList.value[index].wind?.speed.toString() ?? "",
                          image: ImageHandler.houseImage,
                        );
                      },
                    ),
            ],
          ),
        );
      }),
    );
  }
}
