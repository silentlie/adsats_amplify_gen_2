import 'package:flutter/material.dart';

mixin RiskMixin {
  Color getRiskColor(int likelihood, int severity) {
    final risk = likelihood + severity;
    if (likelihood == 0 && severity == 3) {
      return Colors.green;
    } else if (risk < 3) {
      return Colors.green;
    } else if (risk < 6) {
      return Colors.amber;
    } else {
      return Colors.red;
    }
  }

  String getRiskText(int likelihood, int severity) {
    final risk = likelihood + severity;
    if (likelihood == 0 && severity == 3) {
      return "Acceptable";
    } else if (risk < 3) {
      return "Acceptable";
    } else if (risk < 6) {
      return "Review";
    } else {
      return "Unacceptable";
    }
  }
}
