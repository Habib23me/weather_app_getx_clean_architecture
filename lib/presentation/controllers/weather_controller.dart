import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:weather/app/services/location_service.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/usecases/fetch_cached_weather_use_case.dart';
import 'package:weather/domain/usecases/fetch_weather_use_case.dart';

class WeatherController extends GetxController with StateMixin<Weather?> {
  WeatherController({
    required FetchWeatherUseCase fetchWeatherUseCase,
    required LocationService locationService,
    required FetchCachedWeatherUseCase fetchCachedWeatherUseCase,
  })  : _fetchWeatherUseCase = fetchWeatherUseCase,
        _locationService = locationService,
        _cachedWeatherUseCase = fetchCachedWeatherUseCase;

  final FetchWeatherUseCase _fetchWeatherUseCase;
  final FetchCachedWeatherUseCase _cachedWeatherUseCase;

  final LocationService _locationService;

  @override
  void onInit() {
    loadCachedData();
    fetchApiData();
    super.onInit();
  }

  loadCachedData() async {
    final weather = await _cachedWeatherUseCase.execute();
    if (weather.item2 != null) {
      change(null, status: RxStatus.error(weather.item2!.message));
    } else if (weather.item1 != null) {
      change(weather.item1, status: RxStatus.success());
    }
  }

  fetchApiData() async {
    change(null, status: RxStatus.loading());
    final location = await _locationService.getLocation();
    if (location.item2 != null) {
      change(null, status: RxStatus.error(location.item2!.message));
      return;
    }
    final result = await _fetchWeatherUseCase.execute(
      Tuple2(location.item1!.lat, location.item1!.lng),
    );
    if (result.item2 != null) {
      change(null, status: RxStatus.error(result.item2!.message));
      return;
    } else {
      change(result.item1, status: RxStatus.success());
    }
  }
}
