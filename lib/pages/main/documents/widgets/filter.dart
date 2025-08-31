import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/filter.dart';
import 'package:adsats_amplify_gen_2/widgets/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocumentsFilterView extends ConsumerWidget {
  const DocumentsFilterView({
    super.key,
    required this.subcategory,
  });

  final Subcategory subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(documentFilterProvider(subcategory));
    return AlertDialog.adaptive(
      title: const Text('Filter By:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalDropdownMenu(
            entries: const [
              DropdownMenuEntry(value: false, label: "No"),
              DropdownMenuEntry(value: true, label: "Yes"),
              DropdownMenuEntry(value: null, label: "All"),
            ],
            onSelected: (value) {
              filter = filter.copyWith(archived: value);
            },
            initialSelection: filter.archived,
            text: "Archived",
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: DateTimeRangePicker(
              text: "Select document upload time range",
              onSubmitted: (value) {
                filter = filter.copyWith(createdAt: value);
              },
              initialDateRange: filter.createdAt,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: DateTimeRangePicker(
              text: "Select document issue time range",
              onSubmitted: (value) {
                filter = filter.copyWith(issuedAt: value);
              },
              initialDateRange: filter.issuedAt,
              firstDate: DateTime.now().subtract(
                const Duration(days: 365 * 10),
              ),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: DateTimeRangePicker(
              text: "Select document expire time range",
              onSubmitted: (value) {
                filter = filter.copyWith(expiredAt: value);
              },
              initialDateRange: filter.expiredAt,
              firstDate: DateTime.now().subtract(
                const Duration(days: 365 * 10),
              ),
              lastDate: DateTime.now().add(
                const Duration(days: 365 * 10),
              ),
            ),
          ),
        ],
      ),
      actions: [
        // cancel
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            ref.invalidate(documentFilterProvider(subcategory));
            Navigator.pop(context, 'Apply');
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref.read(documentFilterProvider(subcategory).notifier).apply(
                  filter,
                );
            Navigator.pop(context, 'Apply');
          },
          child: const Text('Apply'),
        )
      ],
    );
  }
}
