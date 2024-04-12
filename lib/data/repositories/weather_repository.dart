import 'package:weather/data/models/weather_model.dart';
import 'package:weather/data/providers/local/local_provider.dart';
import 'package:weather/data/providers/network/apis/weather_api.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

enum Keys { weather }

class WeatherRepositoryIml extends WeatherRepository {
  final LocalDataProvider? localProvider;
  WeatherRepositoryIml({ this.localProvider});

  @override
  Future<Weather> fetchWeather(double lat, double long) async {
    final response = await WeatherApi.fetchDaySummary(lat, long).request();
    final weather = WeatherModel.fromJson(response);
    await localProvider?.save(
      model: weather,
      key: Keys.weather.toString(),
    );
    return weather;
  }

  @override
  Future<Weather?> getCachedWeather() {
    return localProvider?.read<WeatherModel>(
      key: Keys.weather.toString(),
      constructor: (json) => WeatherModel.fromLocal(json),
    ) as Future<Weather?>;
  }
}
