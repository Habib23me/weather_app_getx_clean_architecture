import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:weather/app/util/util.dart';

class WeatherPatternWidget extends StatelessWidget {
  final WeatherPatterns weatherPattern;
  final String value;

  const WeatherPatternWidget(
      {super.key, required this.weatherPattern, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          Utils.getWeatherPatternIcons(weatherPattern),
          width: 40,
          height: 40,
          color: Colors.white,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          weatherPattern.name.capitalizeFirst ?? "",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
