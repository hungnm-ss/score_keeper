import 'dart:typed_data';
import 'package:dio/dio.dart';

abstract class Parse {
  static int toIntValue(dynamic value, {int returnValue = -1}) {
    if (value is int) {
      return value;
    }
    if (value is double) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value) ?? returnValue;
    }
    return returnValue;
  }

  static double? toDoubleValue(dynamic value, {double? returnValue}) {
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    }
    if (value is String) {
      return double.tryParse(value) ?? returnValue;
    }
    return returnValue;
  }

  static String toStringValue(dynamic value) {
    if (value is int || value is double || value is num) {
      return value.toString();
    }
    if (value is String) {
      return value;
    }
    return '';
  }

  static bool toBoolValue(dynamic value) {
    if (value is bool) {
      return value;
    }
    if (value is int) {
      switch (value) {
        case 1:
          return true;
        case 0:
          return false;
      }
    }
    return false;
  }

  static num? toNumValue(dynamic value, {num? defaultValue}) {
    if (value is int || value is double) {
      return value;
    }
    if (value is String) {
      return num.tryParse(value);
    }
    return defaultValue;
  }

  static String roundThreeDoubleValue(double value) {
    final double rounded = value * 100 * 1000;
    return (rounded.round() / 1000).toString();
  }
}
