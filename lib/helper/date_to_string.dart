import 'package:intl/intl.dart';

String toDateString(DateTime? date) {
  if (date == null) {
    return '';
  }
  final day = DateFormat('dd').format(date);
  final month = DateFormat('MMM', 'en_US')
      .format(date)
      .toUpperCase();
  final year = DateFormat('yyyy').format(date);
  return '$day$month$year';
}
