import 'package:intl/intl.dart';

const String defaultFormat = 'dd/MM/yyyy - hh:mm a';
const String ymdhmFormat = 'yyyy/MM/dd - HH:mm';
const String hmFormat = 'HH:mm';
const String isoFormat = 'yyyy-MM-ddTHH:mm:ssZ';

class DateTimeUtils {
  static String getTomorrowDateString({required String format}) {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    return tomorrow.millisecondsSinceEpoch
        .toMillisecondDateString(format: format);
  }

  static String getDateString({required String format}) {
    final now = DateTime.now();
    return now.millisecondsSinceEpoch.toMillisecondDateString(format: format);
  }
}

extension IntExtension on int {
  String toDateString({String format = defaultFormat}) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    final DateFormat formatter = DateFormat(format);
    return formatter.format(date);
  }

  String toMillisecondDateString({String format = defaultFormat}) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(this);
    final DateFormat formatter = DateFormat(format);
    return formatter.format(date);
  }

  // milliseconds
  String toHumanReadable() {
    int minutes = ((this / (1000 * 60)) % 60).floor();
    int hours = ((this / (1000 * 60 * 60)) % 24).floor();
    int days = ((this / (1000 * 60 * 60 * 24))).floor();
    if (days > 0) {
      return '$days days ago';
    }
    if (hours > 0) {
      return '$hours hours ago';
    }
    return '$minutes minutes ago';
  }

  String toTimeRemaining() {
    int seconds = ((this / 1000) % 60).floor();
    int minutes = ((this / (1000 * 60)) % 60).floor();
    int hours = ((this / (1000 * 60 * 60))).floor();
    return '${addZero(hours)}h : ${addZero(minutes)}m : ${addZero(seconds)}s';
  }

  String addZero(int number) => number < 10 ? '0$number' : '$number';
}

extension DateExtension on DateTime {
  String toDateString({String format = defaultFormat}) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(toLocal());
  }
}

extension StringDateExtension on String {
  String convertIsoTimeToString({String format = "yyyy-MM-dd"}) {
    var dateTime = DateFormat(isoFormat).parse(this, true);
    return dateTime.toDateString(format: format);
  }

  String convertToDateString(
      {required String fromFormat, required String toFormat}) {
    var dateTime = DateFormat(fromFormat).parse(this);
    return dateTime.toDateString(format: toFormat);
  }
}
