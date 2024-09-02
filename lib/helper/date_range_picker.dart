import 'package:adsats_amplify_gen_2/helper/mutable_date_time_range.dart';
import 'package:flutter/material.dart';

class DateTimeRangePicker extends StatefulWidget {
  const DateTimeRangePicker(
      {super.key, required this.timeRange, this.text = "Select a date range"});
  final MutableDateTimeRange timeRange;
  final String text;

  @override
  State<DateTimeRangePicker> createState() => _DateTimeRangePickerState();
}

class _DateTimeRangePickerState extends State<DateTimeRangePicker> {
  DateTimeRange? _dateTimeRange;
  @override
  Widget build(BuildContext context) {
    _dateTimeRange = widget.timeRange.dateTimeRange;
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
        if (_dateTimeRange != null) {
          widget.timeRange.dateTimeRange = _dateTimeRange!;
        }
        setState(() {});
      },
      child: Text(
        _dateTimeRange == null
            ? widget.text
            : widget.timeRange.toDateRangeString(),
      ),
    );
  }
}
