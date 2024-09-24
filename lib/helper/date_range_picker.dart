import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeRangePicker extends StatefulWidget {
  const DateTimeRangePicker({
    super.key,
    this.text = "Select a date range",
    required this.onSubmitted,
    this.initialDateRange,
  });
  final ValueChanged<DateTimeRange?> onSubmitted;
  final String text;
  final DateTimeRange? initialDateRange;

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
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
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
      child: Text(
        _formatDateRange()
      ),
    );
  }

  String _formatDateRange() {
    if (_dateTimeRange == null) {
      return widget.text;
    } else {
      final start = DateFormat('dd/MM/yyyy').format(_dateTimeRange!.start);
      final end = DateFormat('dd/MM/yyyy').format(_dateTimeRange!.end);
      return "$start - $end";
    }
  }
}
