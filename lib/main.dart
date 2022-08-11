import 'package:flutter/material.dart';

import 'app.dart';
import 'utils/dependency_init.dart';

Future<void> main() async {
  runApp(const MyApp());

  await _initDependency();
}

Future<void> _initDependency() async {
  await DependencyInitializer.init();
}
