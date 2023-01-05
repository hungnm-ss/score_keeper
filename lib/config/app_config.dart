import 'package:base_flutter/constants/enum_extension.dart';
import '../constants/enum.dart';

class FlavorValues {
  final String apiUrl;
  final bool enableLog;

  FlavorValues({
    required this.apiUrl,
    required this.enableLog,
  });
}

class AppConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;

  static AppConfig? _instance;

  factory AppConfig(Flavor flavor, String name) {
    return _instance ??= AppConfig._internal(
      flavor,
      name,
      flavor.getValues(),
    );
  }

  AppConfig._internal(
    this.flavor,
    this.name,
    this.values,
  );

  static AppConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.production;

  static bool isStaging() => _instance!.flavor == Flavor.staging;
}
