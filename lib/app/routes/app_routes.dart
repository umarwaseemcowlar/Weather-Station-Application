import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_station_app/app/views/weather_screen.dart';

class AppRoutes {
  static const String weatherScreen = "/weather-screen";
  // static const String loginScreen = "/login-screen";

  static List<GetPage<dynamic>> get getAppRoutes {
    return [
      GetPage(name: weatherScreen, page: () => WeatherScreen()),
      // GetPage(name: loginScreen, page: () => const LoginScreen()),
    ];
  }
}
