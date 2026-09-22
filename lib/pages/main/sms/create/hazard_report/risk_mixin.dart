import 'package:material_ui/material_ui.dart';

mixin RiskMixin {
  bool isAlarpEligible(int likelihood, int severity) {
    return getRiskText(likelihood, severity) != "Acceptable";
  }

  Color getRiskColor(
    int likelihood,
    int severity, {
    bool alarp = false,
  }) {
    if (alarp && isAlarpEligible(likelihood, severity)) {
      return Colors.green.shade300;
    }

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
