import 'dart:convert';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/data/models/weather_model.dart';

class LocalStorageService extends GetxService {
  SharedPreferences? sharedPreferences;
  Future<LocalStorageService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}
