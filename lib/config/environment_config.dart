// environment_config.dart
class EnvironmentConfig {
  static EnvironmentConfig? _instance;
  late final String env;
  late final String label;

  EnvironmentConfig._();

  factory EnvironmentConfig() {
    _instance ??= EnvironmentConfig._();
    return _instance!;
  }
}
