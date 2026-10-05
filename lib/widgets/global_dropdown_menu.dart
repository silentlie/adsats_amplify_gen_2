import 'package:adsats_amplify_gen_2/helper/extensions/model_selection_extension.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:material_ui/material_ui.dart';

class GlobalDropdownMenu<T> extends StatelessWidget {
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
    final availableEntries = entries.where((entry) {
      final value = entry.value;
      return value is! Model || !value.isArchivedSelection;
    }).toList();
    var selection = initialSelection;
    if (selection is Model) {
      final matching = availableEntries
          .where((entry) => sameSelection(entry.value, selection))
          .firstOrNull;
      if (matching != null) {
        selection = matching.value;
      } else {
        availableEntries.add(DropdownMenuEntry<T>(
          value: selection as T,
          label: '${selection.selectionLabel} '
              '(${selection.isArchivedSelection ? 'Archived' : 'Unavailable'})',
          enabled: false,
        ));
      }
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownMenu<T>(
        dropdownMenuEntries: availableEntries,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        hintText: text,
        menuHeight: 200,
        label: Text(text),
        onSelected: onSelected,
        expandedInsets: EdgeInsets.zero,
        enabled: enabled,
        initialSelection: selection,
        enableSearch: enableSearch,
      ),
    );
  }
}
