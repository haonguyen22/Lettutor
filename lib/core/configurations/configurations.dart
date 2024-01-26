import 'package:let_tutor/core/configurations/default_env.dart';

class Configurations {
  static String _name = DefaultEnv.name;
  static String _environment = DefaultEnv.environment;
  static String _baseUrl = DefaultEnv.baseUrl;

  static String get name => _name;
  static String get environment => _environment;
  static String get baseUrl => _baseUrl;

  void setConfigurationValues(Map<String, dynamic> env) {
    _name = env['name'] ?? DefaultEnv.name;
    _environment = env['environment'] ?? DefaultEnv.environment;
    _baseUrl = env['baseUrl'] ?? DefaultEnv.baseUrl;
  }
}
