class Weather {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  double? cloud;
  double? windSpeed;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.cloud,
    this.humidity,
    this.seaLevel,
    this.windSpeed,
    this.grndLevel,
    this.id,
    this.main,
    this.description,
    this.icon,
  });
}
