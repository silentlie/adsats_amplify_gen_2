part of 'documents_widget.dart';

class DateTimeRangePicker extends StatefulWidget {
  const DateTimeRangePicker({super.key, required this.filter});
  final DocumentsFilter filter;

  @override
  State<DateTimeRangePicker> createState() => _DateTimeRangePickerState();
}

class _DateTimeRangePickerState extends State<DateTimeRangePicker> {
  DateTimeRange? _dateTimeRange;
  @override
  Widget build(BuildContext context) {
    _dateTimeRange = widget.filter.createdAt;
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
          widget.filter.createdAt = _dateTimeRange;
        }
        setState(() {});
      },
      child: Text(
        _dateTimeRange == null
            ? "Select a date range"
            // need to modify for readable string
            : "${DateFormat('dd/MM/yyyy').format(_dateTimeRange!.start)} - ${DateFormat('dd/MM/yyyy').format(_dateTimeRange!.end)}",
      ),
    );
  }
}
