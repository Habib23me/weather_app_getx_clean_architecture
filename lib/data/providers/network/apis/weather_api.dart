import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:weather/data/providers/network/apis/api_endpoint.dart';
import 'package:weather/data/providers/network/api_provider.dart';
import 'package:weather/data/providers/network/api_request_representable.dart';

enum WeatherApiType { daySummary }

class WeatherApi implements APIRequestRepresentable {
  final WeatherApiType type;
  String apiKey;
  double lat;
  double lng;

  WeatherApi._({
    required this.type,
    required this.lat,
    required this.lng,
    required this.apiKey,
  });

  WeatherApi.fetchDaySummary(double lat, double lng)
      : this._(
          type: WeatherApiType.daySummary,
          lat: lat,
          lng: lng,
          apiKey: dotenv.env['WEATHER_MAP_API_KEY'] ?? '',
        );

  @override
  String get endpoint => APIEndpoint.weatherApi;

  @override
  String get path {
    switch (type) {
      case WeatherApiType.daySummary:
        return "/weather";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get query {
    switch (type) {
      case WeatherApiType.daySummary:
        return {
          "lat": "$lat",
          "lon": "$lng",
          "appid": apiKey,
          "units": "metric",
        };
    }
  }

  @override
  get body => null;

  @override
  Map<String, String>? get headers => {
        "Content-Type": "application/json",
      };

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
