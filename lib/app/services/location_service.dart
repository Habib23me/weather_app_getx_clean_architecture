//  bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error(
//         'Location services are disabled.',
//       );
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error(
//           'Location permissions are denied',
//         );
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.',
//       );
//     }
//     final result = await Geolocator.getCurrentPosition();
//     return LocationModel(
//       result.latitude,
//       result.longitude,
//     );
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:weather/data/providers/network/api_provider.dart';
import 'package:weather/domain/entities/location.dart';

abstract class LocationService {
  Future<Tuple2<Location?, AppException?>> getLocation();
}

class GeoLocationService extends GetxService implements LocationService {
  @override
  Future<Tuple2<Location?, AppException?>> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Tuple2(
        null,
        AppException(
          message: 'Location services are disabled.',
          code: 'location_disabled',
        ),
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Tuple2(
          null,
          AppException(
            message: 'Location permissions are denied',
            code: 'location_permission_denied',
          ),
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Tuple2(
        null,
        AppException(
          message:
              'Location permissions are permanently denied, we cannot request permissions.',
          code: 'location_permission_denied_forever',
        ),
      );
    }

    final response = await Geolocator.getCurrentPosition();
    return Tuple2(
      Location(
        response.latitude,
        response.longitude,
      ),
      null,
    );
  }
}
