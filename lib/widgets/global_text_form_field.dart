import 'package:flutter/material.dart';

class GlobalTextFormField extends StatelessWidget {
  const GlobalTextFormField({
    super.key,
    required this.labelText,
    this.initialValue,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    required this.onSaved,
    this.isEmail = false,
    this.isFileName = false,
    this.maxLines,
    this.minLines,
    this.decoration,
    this.padding = const EdgeInsets.all(8.0),
  });
  final String labelText;
  final String? initialValue;
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final ValueChanged<String?> onSaved;
  final bool isEmail;
  final bool isFileName;
  final int? maxLines;
  final int? minLines;
  final InputDecoration? decoration;
  final EdgeInsetsGeometry padding;

  String? validatorTextFormField(String? value) {
    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );
    final RegExp fileNameRegExp =
        RegExp(r"""^[^~)(!'*<>:;,?"*|/]+\.[A-Za-z]{2,4}$""");
    if (!enabled) {
      return null;
    } else if (value == null || value.isEmpty) {
      return 'Please enter the ${labelText.toLowerCase()}';
    } else if (isEmail && !emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    } else if (isFileName && !fileNameRegExp.hasMatch(value)) {
      return 'Please enter a valid file name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        decoration: decoration ??
            InputDecoration(
              labelText: labelText,
              hintText: 'Please enter the ${labelText.toLowerCase()}',
              border: const OutlineInputBorder(),
            ),
        textCapitalization: TextCapitalization.sentences,
        readOnly: readOnly,
        minLines: minLines,
        maxLines: maxLines,
        validator: validatorTextFormField,
        controller: controller,
        buildCounter: (context,
            {required currentLength, required isFocused, required maxLength}) {
          if (isFocused && !readOnly) {
            return Text(currentLength.toString());
          }
          return null;
        },
        onSaved: onSaved,
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: enabled,
      ),
    );
  }
}
