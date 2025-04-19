import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';


class MultiSelectFormField<T extends Model> extends FormField<List<T>> {
  MultiSelectFormField({
    super.key,
    String? title,
    required List<T> items,
    required CheckListCard<T> Function(T value) toCard,
    void Function(List<T> options)? onChange,
    bool enabled = true, // Default value here
    EdgeInsetsGeometry padding =
        const EdgeInsets.all(8.0), // Default value here
    super.initialValue = const [],
    super.onSaved,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.restorationId,
  }) : super(
          builder: (FormFieldState<List<T>> state) {
            return _MultiSelectFormFieldContent<T>(
              state: state,
              title: title,
              items: items,
              toCard: toCard,
              onChange: onChange,
              enabled: enabled,
              padding: padding,
            );
          },
        );
}

class _MultiSelectFormFieldContent<T extends Model> extends StatelessWidget {
  final FormFieldState<List<T>> state;
  final String? title;
  final List<T> items;
  final CheckListCard<T> Function(T value) toCard;
  final void Function(List<T> options)? onChange;
  final bool enabled;
  final EdgeInsetsGeometry padding;

  const _MultiSelectFormFieldContent({
    required this.state,
    this.title,
    required this.items,
    required this.toCard,
    this.onChange,
    required this.enabled,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(context, theme),
          _buildErrorText(theme),
          if (state.value?.isNotEmpty ?? false) const SizedBox(height: 5),
          _buildSelectedChips(theme),
        ],
      ),
    );
  }

  void _updateSelection(List<T> selectedItems) {
    state.didChange(selectedItems);
    if (onChange != null) {
      onChange!(selectedItems);
    }
  }

  Widget _buildTextField(BuildContext context, ThemeData theme) {
    final selectionText = state.value?.isNotEmpty == true
        ? "${state.value!.length} selected"
        : "Tap to select";
    return InkWell(
      onTap: enabled ? () => _showSelectionDialog(context) : null,
      borderRadius: BorderRadius.circular(4.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: title,
          border: const OutlineInputBorder(),
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: enabled ? theme.colorScheme.primary : theme.disabledColor,
          ),
          enabled: enabled,
          labelStyle: enabled
              ? theme.inputDecorationTheme.labelStyle
              : theme.inputDecorationTheme.labelStyle?.copyWith(
                  color: theme.disabledColor,
                ),
        ),
        child: Text(
          selectionText,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: enabled
                ? theme.textTheme.bodyMedium?.color
                : theme.disabledColor,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorText(ThemeData theme) {
    if (!state.hasError) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        state.errorText ?? '',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.error,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildSelectedChips(ThemeData theme) {
    if (state.value?.isEmpty ?? true) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 4.0,
        children: state.value!.map((item) {
          final onDeleted = enabled
              ? () {
                  _updateSelection((state.value ?? [])..remove(item));
                }
              : null;
          return Chip(
            label: toCard(item).title!,
            backgroundColor: theme.chipTheme.backgroundColor,
            labelStyle: theme.chipTheme.labelStyle,
            deleteIcon: Icon(
              Icons.cancel,
              size: 18,
              color: theme.chipTheme.deleteIconColor,
            ),
            onDeleted: onDeleted,
          );
        }).toList(),
      ),
    );
  }

  Future<void> _showSelectionDialog(BuildContext context) async {
    final theme = Theme.of(context);
    final ctr = MultiSelectController<T>();
    List<CheckListCard<T>> cards = items.map((e) {
      final card = toCard(e);
      card.selected = state.value?.contains(card.value) ?? false;
      return card;
    }).toList();

    await showDialog<List<T>>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text(
            title ?? "",
            style: theme.textTheme.titleLarge,
          ),
          content: SizedBox(
            width: 400,
            child: MultiSelectCheckList(
              items: cards,
              onChange: (selectedItems, selectedItem) {
                _updateSelection(selectedItems);
              },
              controller: ctr,
            ),
          ),
          actions: [
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurface,
              ),
              label: const Text('Back'),
              icon: Icon(Icons.arrow_circle_left_outlined),
            ),
            ElevatedButton.icon(
              onPressed: () => ctr.deselectAll(),
              style: ElevatedButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurface,
              ),
              label: const Text("Deselect All"),
              icon: Icon(Icons.remove_done_outlined),
            ),
            ElevatedButton.icon(
              onPressed: () => ctr.selectAll(),
              style: ElevatedButton.styleFrom(
                foregroundColor: theme.colorScheme.primary,
                backgroundColor: theme.colorScheme.primaryContainer,
              ),
              label: const Text("Select All"),
              icon: Icon(Icons.done_all_outlined),
            ),
          ],
        );
      },
    );
  }
}
