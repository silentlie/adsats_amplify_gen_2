import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class GlobalDropdownMenu<T extends Model> extends StatelessWidget {
  const GlobalDropdownMenu({
    super.key,
    required this.entries,
    this.enabled = true,
    this.text = "",
    this.enableSearch = true,
    required this.onSelected,
    this.initialSelection,
    this.padding = const EdgeInsets.all(8),
  });

  final List<DropdownMenuEntry<T>> entries;
  final bool enabled;
  final bool enableSearch;
  final String text;
  final ValueChanged<T?> onSelected;
  final T? initialSelection;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownMenu<T>(
        dropdownMenuEntries: entries,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        hintText: text,
        menuHeight: 200,
        label: Text(text),
        onSelected: onSelected,
        expandedInsets: EdgeInsets.zero,
        enabled: enabled,
        initialSelection: initialSelection,
        enableSearch: enableSearch,
      ),
    );
  }
}
