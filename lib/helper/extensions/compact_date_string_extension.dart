import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:intl/intl.dart';

extension CompactDateString on DateTime {
  String get toCompactDateString {
    return DateFormat('ddMMMyyyy', 'en_US').format(toLocal()).toUpperCase();
  }
}

extension TemporalDateTimeFormatX on TemporalDateTime {
  String get toCompactDateString {
    return DateFormat('ddMMMyyyy', 'en_US')
        .format(getDateTimeInUtc().toLocal())
        .toUpperCase();
  }
}
