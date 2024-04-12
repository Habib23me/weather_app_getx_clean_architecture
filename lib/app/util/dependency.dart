import 'package:get/get.dart';
import 'package:weather/app/services/local_storage.dart';
import 'package:weather/app/services/location_service.dart';
import 'package:weather/data/providers/local/local_provider.dart';
import 'package:weather/data/providers/local/shared_preference_local_provider.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut<LocalDataProvider>(
      () => SharedPreferenceLocalProvider(
        Get.find<LocalStorageService>().sharedPreferences,
      ),
    );
    Get.lazyPut(() => WeatherRepositoryIml(localProvider: Get.find<LocalDataProvider>()));
    Get.lazyPut<LocationService>(() => GeoLocationService());
  }
}
