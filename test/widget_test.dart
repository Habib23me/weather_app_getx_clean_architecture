// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tuple/tuple.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/domain/usecases/fetch_cached_weather_use_case.dart';
import 'package:weather/domain/usecases/fetch_weather_use_case.dart';
import 'package:weather/presentation/controllers/weather_controller.dart';

import 'repositories/mock_weather_repository.dart';
import 'service/mock_location_service.dart';

void main() {
  test('Fetch weather case with sample data', () async {
    const lat = 37.7749;
    const long = 122.4194;
    final fetchHeadlineUseCase = FetchWeatherUseCase(MockWeatherRepository());
    final result = await fetchHeadlineUseCase.execute(const Tuple2(lat, long));
    expect(result.item1, isNotNull);
  });

  test('Fetch weather use case with api', () async {
    const lat = 37.7749;
    const long = 122.4194;
    await dotenv.load(fileName: ".env");
    final fetchHeadlineUseCase = FetchWeatherUseCase(WeatherRepositoryIml());
    final result = await fetchHeadlineUseCase.execute(const Tuple2(lat, long));
    expect(result.item1, isNotNull);
  });

  test('fetch weather controller fetching data with mock repository', () async {
    final weatherController = WeatherController(
      fetchWeatherUseCase: FetchWeatherUseCase(MockWeatherRepository()),
      locationService: MockLocationService(),
      fetchCachedWeatherUseCase:
          FetchCachedWeatherUseCase(MockWeatherRepository()),
    );
    await weatherController.fetchApiData();
    expect(weatherController.state, isNotNull);
  });
}
