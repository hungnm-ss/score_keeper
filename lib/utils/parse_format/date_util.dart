import 'package:intl/intl.dart';

const String defaultFormat = 'yyyy/MM/dd - hh:mm a';
const String ymdhmFormat = 'yyyy/MM/dd - HH:mm';

const String isoFormat = 'yyyy-MM-ddTHH:mm:ssZ';

class DateTimeUtils {
  static String getTomorrowDateString({required String format}) {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    return tomorrow.millisecondsSinceEpoch
        .toMillisecondDateString(format: format);
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

  /* for milliseconds
  */
  String toHumanReadable() {
    int minutes = ((this / (1000 * 60)) % 60).floor();
    int hours = ((this / (1000 * 60 * 60)) % 24).floor();
    int days = ((this / (1000 * 60 * 60 * 24))).floor();
    if (days > 0) {
      return '$days ${('days')} ${('ago')}';
    }
    if (hours > 0) {
      return '$hours ${('hours')} ${('ago')}';
    }
    return '$minutes ${('minutes')} ${('ago')}';
  }

  String toTimeRemaining() {
    int seconds = ((this / 1000) % 60).floor();
    int minutes = ((this / (1000 * 60)) % 60).floor();
    int hours = ((this / (1000 * 60 * 60)) % 24).floor();
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

  // for post time has pass
  String convertCovalentDateToTimeHasPass({bool isShort = false}) {
    var dateTime = DateFormat(isoFormat).parse(this, true);
    var currentDate = DateTime.now();
    final difference = currentDate.difference(dateTime);
    var secondDiff = difference.inSeconds;
    var minuteDiff = difference.inMinutes;
    var hoursDiff = difference.inHours;
    var dayDiff = difference.inDays;
    var week = dayDiff ~/ 7;
    var year = dayDiff ~/ 365;
    var result = '';
    if (secondDiff < 60) {
      return ('Just now');
    } else {
      if (hoursDiff < 1) {
        result = '$minuteDiff' + (isShort ? 'm' : ' ${('minute')}');
      } else if (dayDiff < 1) {
        result = '$hoursDiff' + (isShort ? 'h' : ' ${('hours')}');
      } else if (week < 1) {
        result = '$dayDiff' + (isShort ? 'd' : ' ${('days')}');
      } else if (year < 1) {
        result = '$week' + (isShort ? 'w' : ' ${('weeks')}');
      } else {
        result = '$year' + (isShort ? 'y' : ' ${('years')}');
      }
    }

    return result + (isShort ? '' : ' ${('ago')}');
  }
}
