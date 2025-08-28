import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:flutter/material.dart';

class DateTimeRangePicker extends StatefulWidget {
  const DateTimeRangePicker({
    super.key,
    this.text = "Select a date range",
    required this.onSubmitted,
    this.initialDateRange,
    this.firstDate,
    this.lastDate,
  });
  final ValueChanged<DateTimeRange?> onSubmitted;
  final String text;
  final DateTimeRange? initialDateRange;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<DateTimeRangePicker> createState() => _DateTimeRangePickerState();
}

class _DateTimeRangePickerState extends State<DateTimeRangePicker> {
  late DateTimeRange? _dateTimeRange = widget.initialDateRange;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        _dateTimeRange = await showDateRangePicker(
          context: context,
          firstDate: widget.firstDate ?? DateTime(2000),
          lastDate: widget.lastDate ?? DateTime.now(),
          initialDateRange: _dateTimeRange,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 500, maxHeight: 550),
                  child: child,
                )
              ],
            );
          },
        );
        widget.onSubmitted(_dateTimeRange);
        setState(() {});
      },
      child: Text(_formatDateRange()),
    );
  }

  String _formatDateRange() {
    if (_dateTimeRange == null) {
      return widget.text;
    } else {
      final start = _dateTimeRange!.start.toCompactDateString;
      final end = _dateTimeRange!.end.toCompactDateString;
      return "$start - $end";
    }
  }
}
