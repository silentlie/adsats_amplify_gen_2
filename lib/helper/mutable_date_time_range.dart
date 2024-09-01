import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MutableDateTimeRange {
  /// Creates a date range for the given [DateTimeRange].
  MutableDateTimeRange({
    this.dateTimeRange,
  });

  /// The range of dates and times.
  DateTimeRange? dateTimeRange;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is MutableDateTimeRange &&
        other.dateTimeRange == dateTimeRange;
  }

  @override
  int get hashCode => dateTimeRange.hashCode;

  @override
  String toString() {
    return dateTimeRange.toString();
  }

  String toDateRangeString() {
    return "${DateFormat('dd/MM/yyyy').format(dateTimeRange!.start)} - ${DateFormat('dd/MM/yyyy').format(dateTimeRange!.end)}";
  }

  List<String> toIso8601String() {
    return [
      dateTimeRange?.start.toIso8601String()??"",
      dateTimeRange?.end.toIso8601String()??"",
    ];
  }
}
