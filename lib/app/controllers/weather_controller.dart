import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_station_app/data/models/weather_data_model.dart';
import 'package:weather_station_app/data/repository/weather_repository.dart';
import 'package:weather_station_app/global/utils/geo_locator.dart';
import 'package:weather_station_app/global/utils/logger.dart';

class WeatherScreenController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<WeatherDataModel?> weatherData = Rx<WeatherDataModel?>(null);
  RxString cityName = "".obs;
  RxString weatherDescription = "".obs;
  RxString temperature = "".obs;

  @override
  void onReady() {
    super.onReady();
    getWeatherForCurrentPosition();
  }

  Future<void> getWeatherForCurrentPosition() async {
    isLoading.value = true;
    final Position location = await GeoLocatorUtility.determineCurrentPosition();
    // in case of error, Future.error() is returned, check for that

    if (location == null) {
      Logger.error("getWeatherByCity(): Location is null");
      return;
    }

    weatherData.value =
        await WeatherRepository.getWeatherData(latitude: location.latitude.toString(), longitude: location.longitude.toString());
    cityName.value = weatherData.value!.name.toString();
    weatherDescription.value = weatherData.value!.weather![0].description.toString();
    // convert temperature from Farenheit to Celsius
    temperature.value = (weatherData.value!.main!.temp! - 273.15).toStringAsFixed(2);
    Logger.success("getWeatherByCity(): Weather Data: ${weatherData.value.toString()}");
    isLoading.value = false;
    update();
  }
}
