import 'package:get/get.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/domain/usecases/fetch_cached_weather_use_case.dart';
import 'package:weather/domain/usecases/fetch_weather_use_case.dart';
import 'package:weather/presentation/controllers/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchWeatherUseCase(Get.find<WeatherRepositoryIml>()));
    Get.lazyPut(
        () => FetchCachedWeatherUseCase(Get.find<WeatherRepositoryIml>()));
    Get.lazyPut(
      () => WeatherController(
        fetchWeatherUseCase: Get.find(),
        locationService: Get.find(),
        fetchCachedWeatherUseCase: Get.find(),
      ),
    );
  }
}
