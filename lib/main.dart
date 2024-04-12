import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:weather/app.dart';
import 'package:weather/app/services/local_storage.dart';
import 'package:weather/app/util/dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initServices();
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

initServices() async {
  await Get.putAsync(() => LocalStorageService().init());
}
