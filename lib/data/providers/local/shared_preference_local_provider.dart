

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/types/serializable_model.dart';
import 'package:weather/data/providers/local/local_provider.dart';

class SharedPreferenceLocalProvider implements LocalDataProvider {
 final SharedPreferences? _sharedPreferences;
  SharedPreferenceLocalProvider(this._sharedPreferences);

  @override
  Future save({
    required SeriliazableModel model,
    required String key,
  }) async {
    _sharedPreferences?.setString(key, json.encode(model.toJson()));
  }

  @override
  Future<T?> read<T>({
    required JsonConstructor<T> constructor,
    required String key,
  }) async {
    final rawJson = _sharedPreferences?.getString(key);
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(rawJson);
    return constructor(map);
  }
}
