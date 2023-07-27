import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_station_app/app/controllers/weather_controller.dart';
import 'package:weather_station_app/app/themes/colors.dart';
import 'package:weather_station_app/app/widgets/app_bar_widget.dart';
import 'package:weather_station_app/app/widgets/app_drawer.dart';
import 'package:weather_station_app/app/widgets/weather_data_display_widget.dart';
import 'package:weather_station_app/app/widgets/weather_panel_widget.dart';
import 'package:weather_station_app/global/common/animation_widget.dart';
import 'package:weather_station_app/global/constants/images_handler.dart';
import 'package:weather_station_app/global/utils/temperature_extensions.dart';

class WeatherScreen extends GetView<WeatherScreenController> {
  WeatherScreen({Key? key}) : super(key: key);

  final _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        drawerDragStartBehavior: DragStartBehavior.down,
        backgroundColor: AppColors.primaryPurpleLight,
        drawer: const AppDrawerWidget(),
        body: Stack(
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
                      getAppBar(context, controller),
                      const SizedBox(height: 20),
                      WeatherDataDisplayWidget(
                          cityName: controller.weatherData.value?.name ?? "",
                          temperature: "${controller.weatherData.value?.main?.temp!.farenheitToCelcius() ?? ""}°",
                          weatherDescription: controller.weatherData.value?.weather?.first.description!.toUpperCase() ?? "",
                          humidity: "Humidity: ${controller.weatherData.value?.main?.humidity.toString() ?? ""}%",
                          wind: "Wind: ${controller.weatherData.value?.wind?.speed.toString() ?? ""} km/h"),
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
              slideDirection: SlideDirection.UP,
              color: Colors.transparent,
              panelBuilder: (scrollController) => buildWeatherPanel(),
              minHeight: MediaQuery.of(context).size.height * 0.35,
              controller: _panelController,
            ),
          ],
        ),
      );
    });
  }
}
