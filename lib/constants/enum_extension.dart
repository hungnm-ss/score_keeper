import 'package:score_keeper/config/app_config.dart';
import 'package:score_keeper/constants/enum.dart';

extension FlavorExtension on Flavor {
  FlavorValues getValues() {
    switch (this) {
      case Flavor.development:
        return FlavorValues(apiUrl: 'dev_url', enableLog: true);
      case Flavor.staging:
        return FlavorValues(apiUrl: 'stg_url', enableLog: true);
      case Flavor.production:
        return FlavorValues(apiUrl: 'prd_url', enableLog: true);
    }
  }
}
