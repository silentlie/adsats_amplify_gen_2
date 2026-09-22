import 'package:material_ui/material_ui.dart';

extension ISODateRange on DateTimeRange {
  List<String> get isoBetween {
    return [
      start.toIso8601String(),
      end.toIso8601String(),
    ];
  }
}
