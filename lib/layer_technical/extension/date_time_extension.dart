import 'package:flutter/material.dart';

extension CheckRangeDateTimeExtension on DateTime? {
  bool? isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isAfter(dateTime);
    }
    return null;
  }

  bool? isBeforeOrEqualTo(DateTime dateTime) {
    final date = this;
    if (date != null) {
      final isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
      return isAtSameMomentAs | date.isBefore(dateTime);
    }
    return null;
  }

  bool? isBetweenOrEqual(DateTime fromDateTime, DateTime toDateTime) {
    final date = this;
    if (date != null) {
      final isAfter = date.isAfterOrEqualTo(fromDateTime) ?? false;
      final isBefore = date.isBeforeOrEqualTo(toDateTime) ?? false;
      return isAfter && isBefore;
    }
    return null;
  }

  bool? isBetween(DateTime fromDateTime, DateTime toDateTime) {
    final date = this;
    if (date != null) {
      final isAfter = date.isAfter(fromDateTime);
      final isBefore = date.isBefore(toDateTime);
      return isAfter && isBefore;
    }
    return null;
  }
}

/// Check if year, month and day are the same
extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

/// Transform a DateTime to a TimeOfDay with the same hours and minutes
extension DateTimeToTimeOfDay on DateTime {
  TimeOfDay get toTimeOfDay => TimeOfDay(hour: hour, minute: minute);
}

/// Transform a DateTime to remove all units under the minute to easily compare them
extension DateTimeClearSeconds on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);
  DateTime get dateWithoutSeconds => DateTime(year, month, day, hour, minute);
  DateTime get startOfDay => DateTime(year, month, day);
  DateTime get endOfDay => DateTime(
    year,
    month,
    day,
  ).add(const Duration(days: 1)).subtract(const Duration(microseconds: 1));
}

extension DateTimeExtension on DateTime {
  String toBackendString() => toUtc().toIso8601String();
}
