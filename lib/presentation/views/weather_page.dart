import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/presentation/controllers/weather_controller.dart';
import 'package:weather/presentation/views/widgets/error_widget.dart';
import 'package:weather/presentation/views/widgets/weather_widget.dart';

class WeatherPage extends GetView<WeatherController> {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      body: controller.obx(
        (state) => WeatherWidget(weather: state!),
        onError: (error) => WeatherFetchErrorWidget(error.toString()),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
