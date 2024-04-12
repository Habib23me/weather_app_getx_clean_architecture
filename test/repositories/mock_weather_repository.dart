import 'dart:io';
import 'package:weather/data/models/weather_model.dart';
import 'package:weather/domain/entities/weather.dart';
import 'dart:convert';

import 'package:weather/domain/repositories/weather_repository.dart';

class MockWeatherRepository extends WeatherRepository {
  @override
  Future<Weather> fetchWeather(double lat, double long) async {
    final file = File('test/data/weather_sample.json');
    final response = await file.readAsString();
    final data = await json.decode(response);
    return WeatherModel.fromJson(data);
  }

  @override
  Future<Weather?> getCachedWeather() async {
    return null;
  }
}
