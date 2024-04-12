import 'package:tuple/tuple.dart';
import 'package:weather/app/core/usecases/pram_usecase.dart';
import 'package:weather/data/providers/network/api_provider.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

import '../entities/weather.dart';

class FetchWeatherUseCase extends ParamUseCase<Tuple2<Weather?, AppException?>,
    Tuple2<double, double>> {
  final WeatherRepository _repo;
  FetchWeatherUseCase(this._repo);

  @override
  Future<Tuple2<Weather?, AppException?>> execute(Tuple2 params) async {
    try {
      final result = await _repo.fetchWeather(
        params.item1,
        params.item2,
      );
      return Tuple2(result, null);
    } on AppException catch (e) {
      return Tuple2(null, e);
    } catch (e) {
      return Tuple2(
        null,
        AppException(
          message: e.toString(),
          code: 'unknown_error',
        ),
      );
    }
  }
}
