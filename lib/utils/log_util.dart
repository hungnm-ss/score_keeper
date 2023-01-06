import 'dart:developer' as developer;

import 'package:intl/intl.dart';
import '../config/app_config.dart';

class LoggerUtil {
  static void log(String message, {String? tag, StackTrace? stackTrace}) {
    if (true||AppConfig.instance.values.enableLog) {
      String time = '(${DateFormat('HH:mm:ss').format(DateTime.now())})';
      developer.log('$time - $message',
          name: tag ?? 'log', stackTrace: stackTrace);
    }
  }
}
