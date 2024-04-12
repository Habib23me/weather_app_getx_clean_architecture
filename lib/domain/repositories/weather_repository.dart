import 'package:weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(double lat, double long);

  Future<Weather?> getCachedWeather();
}
