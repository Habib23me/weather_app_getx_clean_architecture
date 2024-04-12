import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:weather/app/types/serializable_model.dart';

typedef JsonConstructor<T> = T Function(Map<String, dynamic> json);

abstract class LocalDataProvider {
  Future save({
    required SeriliazableModel model,
    required String key,
  });

  Future<T?> read<T>({
    required JsonConstructor<T> constructor,
    required String key,
  });
}