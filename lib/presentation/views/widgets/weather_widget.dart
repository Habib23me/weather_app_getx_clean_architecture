// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/app/config/app_colors.dart';
import 'package:weather/app/util/util.dart';

import 'package:weather/domain/entities/weather.dart';
import 'package:weather/presentation/controllers/weather_controller.dart';

import 'weather_pattern_widget.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;
  const WeatherWidget({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            "Today",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat("EE, MMMM d ").format(DateTime.now()),
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: AppColors.darkBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl: Utils.getWeatherImagePath(weather.icon!),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  weather.description?.capitalizeFirst ?? "",
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
                const SizedBox(height: 10),
                Text(
                  "${weather.temp?.toInt()}°",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 10),
                //lowest and highest
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Low: ${weather.tempMin?.toInt()}°",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "High: ${weather.tempMax?.toInt()}°",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                //cloud and humidity, wind
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherPatternWidget(
                      weatherPattern: WeatherPatterns.cloudy,
                      value: "${weather.cloud?.toInt()}%",
                    ),
                    WeatherPatternWidget(
                      weatherPattern: WeatherPatterns.humidity,
                      value: "${weather.humidity?.toInt()}%",
                    ),
                    WeatherPatternWidget(
                      weatherPattern: WeatherPatterns.windy,
                      value: "${weather.windSpeed?.toInt()} km/h",
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Get.find<WeatherController>().fetchApiData();
            },
            icon: const Icon(Icons.refresh),
            label: const Text(
              "Refresh",
            ),
          ),
          Spacer(),
          //Provided by OpenWeatherMap
          Text(
            "Provided by OpenWeatherMap",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white.withOpacity(0.5),
                ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
