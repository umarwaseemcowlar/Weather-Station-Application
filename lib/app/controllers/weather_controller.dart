import 'package:get/get.dart';
import 'package:weather_station_app/data/models/weather_model.dart';
import 'package:weather_station_app/data/repository/weather_repository.dart';

class WeatherScreenController extends GetxController {
  final RxBool isLoading = false.obs;
  Rx<WeatherModel?> weatherData = Rx<WeatherModel?>(null);

  Future<void> getWeatherByCity(String cityName) async {
    isLoading.value = true;
    weatherData.value = await WeatherRepository.getWeatherData(cityName: cityName);
    isLoading.value = false;
  }
}
