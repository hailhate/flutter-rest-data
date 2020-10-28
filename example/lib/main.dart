import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dependencies.dart';
import 'example_app_widget.dart';

Future<void> main() async {
  await Hive.initFlutter();
  configureDependencies();

  runApp(ExampleAppWidget());
}
