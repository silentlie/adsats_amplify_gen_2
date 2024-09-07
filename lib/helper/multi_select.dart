import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelect extends StatelessWidget {
  const MultiSelect({
    super.key,
    this.buttonText,
    this.initialValue = const [],
    required this.onConfirm,
    this.title,
    required this.items,
  });
  final Text? buttonText;
  final List<MultiSelectItem<dynamic>> items;
  final List<dynamic> initialValue;
  final void Function(List<dynamic>) onConfirm;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 666),
      padding: const EdgeInsets.all(8.0),
      child: MultiSelectDialogField(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        buttonText: buttonText,
        items: items,
        initialValue: initialValue,
        // send selected item to filterResult
        onConfirm: onConfirm,
        title: title,
        searchable: true,
        // size of dialog after click each filter
        dialogHeight: 714,
        dialogWidth: 400,
        // can be specify based on ThemeData
        // itemsTextStyle: const TextStyle(color: Colors.amber),
        selectedItemsTextStyle: const TextStyle(color: Colors.blue),
        cancelText: const Text(
          "Cancel",
          // style: TextStyle(color: Colors.amber),
        ),
        confirmText: const Text(
          "Confirm",
          style: TextStyle(color: Colors.blue),
        ),
        chipDisplay: MultiSelectChipDisplay(
          scroll: true,
          scrollBar: HorizontalScrollBar(isAlwaysShown: true),
        ),
      ),
    );
  }
}
