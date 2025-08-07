import 'package:flutter/material.dart';

import 'config/environment_config.dart';
import 'main.dart';

void main() {
  EnvironmentConfig()
    ..env = 'dev'
    ..label = 'Development';

  runApp(MyApp());
}
