import 'package:flutter/material.dart';

import 'config/environment_config.dart';
import 'main.dart';

void main() {
  EnvironmentConfig()
    ..env = 'stag'
    ..label = 'Staging';

  runApp(MyApp());
}
