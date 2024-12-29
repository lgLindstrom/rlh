import 'package:flutter/material.dart';
import 'package:rlh_flutter/core/app/application_widget.dart';
import 'package:rlh_flutter/dio.dart';
import 'package:rlh_flutter/packages/logger/src/level.dart';
import 'package:rlh_flutter/packages/logger/src/logger.dart';

/*

  TODO: Connect to database

  TODO: darkmode/lightmode

  TODO: responsive

*/
final Dio dio = Dio();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dio.init();

  Logger.defaultLevel = Level.INFO;

  runApp(const ApplicationWidget());
}
