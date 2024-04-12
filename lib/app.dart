import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather/app/config/app_colors.dart';
import 'package:weather/presentation/controllers/weather_binding.dart';
import 'package:weather/presentation/views/weather_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: WeatherBinding(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.darkerBlue,
        primaryColor: AppColors.primary,
      ),
      home: const WeatherPage(),
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
    );
  }
}
