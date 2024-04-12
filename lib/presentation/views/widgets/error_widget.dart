import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/presentation/controllers/weather_controller.dart';

class WeatherFetchErrorWidget extends StatelessWidget {
  final String message;

  WeatherFetchErrorWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
          Text(
            message,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {
              Get.find<WeatherController>().fetchApiData();
            },
            icon: const Icon(Icons.refresh),
            label: const Text(
              "Refresh",
            ),
          ),
        ],
      ),
    );
  }
}
