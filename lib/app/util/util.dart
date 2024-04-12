enum WeatherPatterns {
  cloudy,
  humidity,
  windy,
}

class Utils {
  static String getWeatherImagePath(String id, {String? size = '4x'}) {
    return 'https://openweathermap.org/img/wn/$id@$size.png';
  }

  static String getWeatherPatternIcons(WeatherPatterns pattern) {
    switch (pattern) {
      case WeatherPatterns.cloudy:
        return 'assets/icons/cloudy.svg';
      case WeatherPatterns.humidity:
        return 'assets/icons/humidity.svg';
      case WeatherPatterns.windy:
        return 'assets/icons/windy.svg';
    }
  }
}
