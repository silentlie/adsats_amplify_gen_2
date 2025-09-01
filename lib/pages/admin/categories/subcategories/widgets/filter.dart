import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/filter.dart';
import 'package:adsats_amplify_gen_2/widgets/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubcategoryFilterView extends ConsumerWidget {
  const SubcategoryFilterView({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(subcategoryFilterProvider(categoryId));
    return AlertDialog.adaptive(
      title: const Text('Filter By:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalDropdownMenu(
            entries: const [
              DropdownMenuEntry(value: true, label: "No"),
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
              text: "Select created date range",
              onSubmitted: (value) {
                filter = filter.copyWith(createdAt: value);
              },
              initialDateRange: filter.createdAt,
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
            ref.invalidate(subcategoryFilterProvider);
            Navigator.pop(context);
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref
                .read(subcategoryFilterProvider(categoryId).notifier)
                .apply(filter);
            Navigator.pop(context);
          },
          child: const Text('Apply'),
        )
      ],
    );
  }
}
