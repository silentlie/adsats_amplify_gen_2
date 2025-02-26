import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class GlobalMultiSelect<T extends Model> extends StatelessWidget {
  const GlobalMultiSelect({
    super.key,
    this.enabled = true,
    required this.text,
    this.initialValue = const [],
    required this.onConfirm,
    required this.items,
    this.padding = const EdgeInsets.all(8.0),
  });

  final void Function(List<T>) onConfirm;
  final List<T> initialValue;
  final List<MultiSelectItem<T>> items;
  final String text;
  final EdgeInsetsGeometry padding;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: padding,
      child: MultiSelectDialogField<T>(
        decoration: BoxDecoration(
          border: Border.all(
            color:
                enabled ? colorScheme.onSurface : colorScheme.onInverseSurface,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
        buttonText: Text(
          text,
          style: TextStyle(
            color:
                enabled ? colorScheme.onSurface : colorScheme.onInverseSurface,
          ),
        ),
        items: items,
        initialValue: initialValue,
        onConfirm: onConfirm,
        title: Text(text),
        searchable: true,
        // size of dialog after click each filter
        dialogHeight: 714,
        dialogWidth: 400,
        itemsTextStyle: TextStyle(color: colorScheme.primary),
        selectedItemsTextStyle: TextStyle(color: colorScheme.primary),
        cancelText: Text(
          "Cancel",
          style: TextStyle(color: colorScheme.error),
        ),
        confirmText: Text(
          "Confirm",
          style: TextStyle(color: colorScheme.primary),
        ),
        chipDisplay: MultiSelectChipDisplay(
          scroll: true,
          scrollBar: HorizontalScrollBar(isAlwaysShown: true),
          chipColor: colorScheme.secondaryContainer,
          textStyle: TextStyle(color: colorScheme.secondary),
        ),
        checkColor: colorScheme.onSurface,
        selectedColor: colorScheme.surface,
        unselectedColor: colorScheme.onSurface,
        buttonIcon: Icon(
          Icons.arrow_drop_down,
          color: enabled ? colorScheme.onSurface : colorScheme.onInverseSurface,
        ),
      ),
    );
  }
}
