import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_station_app/app/controllers/weather_controller.dart';
import 'package:weather_station_app/app/themes/colors.dart';
import 'package:weather_station_app/app/widgets/app_bar_widget.dart';
import 'package:weather_station_app/app/widgets/app_drawer.dart';
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
                      Text(controller.weatherData.value?.name ?? "", style: Theme.of(context).textTheme.displayLarge),
                      Text("${controller.weatherData.value?.main?.temp!.farenheitToCelcius() ?? ""}°",
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text(controller.weatherData.value?.weather?.first.description!.toLowerCase() ?? "",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // humidity
                          Text("Humidity: ${controller.weatherData.value?.main?.humidity.toString() ?? ""}%",
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
                          const SizedBox(width: 20),
                          Text("Wind: ${controller.weatherData.value?.wind?.speed.toString() ?? ""} km/h",
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.grey)),
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
