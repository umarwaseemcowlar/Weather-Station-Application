import 'package:get/get.dart';
import 'package:weather_station_app/data/models/weather_data_model.dart';
import 'package:weather_station_app/data/repository/weather_repository.dart';
import 'package:weather_station_app/global/utils/logger.dart';

class WeatherScreenController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<WeatherDataModel?> weatherData = Rx<WeatherDataModel?>(null);
  Rx<String> cityName = "Pakistan".obs;

  @override
  void onReady() {
    super.onReady();
    getWeatherByCity(cityName.value);
  }

  Future<void> getWeatherByCity(String cityName) async {
    isLoading.value = true;
    weatherData.value = await WeatherRepository.getWeatherData(latitude: "33.6844", longitude: "73.0479");
    Logger.success("getWeatherByCity(): Weather Data: ${weatherData.value.toString()}");
    isLoading.value = false;
  }
}
