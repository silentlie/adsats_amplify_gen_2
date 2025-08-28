import 'package:flutter/material.dart';

extension ISODateRange on DateTimeRange {
  List<String> get isoBetween {
    return [
      start.toIso8601String(),
      end.toIso8601String(),
    ];
  }
}
