// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:weather/app/types/serializable_model.dart';
import 'package:weather/domain/entities/weather.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Weather implements SeriliazableModel {
  @override
  double? temp;
  @override
  @JsonKey(name: 'feels_like')
  double? feelsLike;
  @override
  @JsonKey(name: 'temp_min')
  double? tempMin;
  @override
  @JsonKey(name: 'temp_max')
  double? tempMax;
  @override
  int? pressure;
  @override
  int? humidity;
  @override
  @JsonKey(name: 'sea_level')
  int? seaLevel;
  @override
  @JsonKey(name: 'grnd_level')
  int? grndLevel;
  @override
  int? id;
  @override
  String? main;
  @override
  String? description;
  @override
  String? icon;
  @override
  @JsonKey(name: 'all')
  double? cloud;
  @override
  @JsonKey(name: 'speed')
  double? windSpeed;

  WeatherModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
    this.id,
    this.main,
    this.description,
    this.icon,
    this.cloud,
    this.windSpeed,
  }) : super(
          temp: temp,
          feelsLike: feelsLike,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          humidity: humidity,
          seaLevel: seaLevel,
          grndLevel: grndLevel,
          id: id,
          main: main,
          description: description,
          cloud: cloud,
          windSpeed: windSpeed,
          icon: icon,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson({
        ...json['main'],
        ...json['weather'][0],
        ...json['clouds'],
        ...json['wind'],
      });

  factory WeatherModel.fromLocal(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
