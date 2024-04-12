import 'package:tuple/tuple.dart';
import 'package:weather/app/core/usecases/no_param_usecase.dart';
import 'package:weather/app/core/usecases/pram_usecase.dart';
import 'package:weather/data/providers/network/api_provider.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

import '../entities/weather.dart';

class FetchCachedWeatherUseCase
    extends NoParamUseCase<Tuple2<Weather?, AppException?>> {
  final WeatherRepository _repo;
  FetchCachedWeatherUseCase(this._repo);

  @override
  Future<Tuple2<Weather?, AppException?>> execute() async {
    try {
      final result = await _repo.getCachedWeather();
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
