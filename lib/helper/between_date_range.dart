import 'package:flutter/material.dart';

List<String> betweenDateRange(DateTimeRange dateTimeRange) {
  return [
    dateTimeRange.start.toIso8601String(),
    dateTimeRange.end.toIso8601String(),
  ];
}
