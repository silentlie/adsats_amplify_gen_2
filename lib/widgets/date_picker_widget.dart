import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    required this.text,
    this.enabled = true,
    this.readOnly = false,
    required this.firstDate,
    required this.lastDate,
    required this.onSelected,
    this.initialValue,
    this.padding = const EdgeInsets.all(8.0),
  });
  final String text;
  final bool enabled;
  final bool readOnly;
  final ValueChanged<TemporalDateTime?> onSelected;
  final TemporalDateTime? initialValue;
  final EdgeInsetsGeometry padding;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime? date = widget.initialValue?.getDateTimeInUtc();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = (date?.toCompactDateString ?? "");
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        enabled: widget.enabled,
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          date = await showDatePicker(
            context: context,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            initialDate: date,
          );
          controller.text = (date?.toCompactDateString ?? "");
          widget.onSelected(toTemporalDateTime(date));
        },
        controller: controller,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          labelText: widget.text,
          hintText: 'Please enter the ${widget.text.toLowerCase()}',
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  TemporalDateTime? toTemporalDateTime(DateTime? date) {
    return date != null ? TemporalDateTime(date) : null;
  }
}
