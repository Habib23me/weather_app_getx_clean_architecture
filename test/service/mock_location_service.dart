import 'package:tuple/tuple.dart';
import 'package:weather/app/services/location_service.dart';
import 'package:weather/data/providers/network/api_provider.dart';
import 'package:weather/domain/entities/location.dart';

class MockLocationService implements LocationService {
  @override
  Future<Tuple2<Location?, AppException?>> getLocation() {
    return Future.value(Tuple2(Location(37.7749, 122.4194), null));
  }
}
