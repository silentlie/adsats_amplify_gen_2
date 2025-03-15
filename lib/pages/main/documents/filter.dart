import 'package:adsats_amplify_gen_2/helper/between_date_range.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/widgets/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@Riverpod(dependencies: [])
class DocumentFilter extends _$DocumentFilter {
  @override
  DocumentFilterState build(Subcategory subcategory) {
    return DocumentFilterState(subcategory: subcategory);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(DocumentFilterState newState) {
    state = newState;
  }
}

@freezed
sealed class DocumentFilterState with _$DocumentFilterState {
  DocumentFilterState._();
  factory DocumentFilterState({
    required Subcategory subcategory,
    @Default("") String search,
    @Default(false) bool? archived,
    DateTimeRange? createdAt,
  }) = _DocumentFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    search.isNotEmpty ? result["name"] = {"contains": search} : null;
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {"between": betweenDateRange(createdAt!)}
        : null;
    result["subcategoryId"] = {"eq": subcategory.id};
    return result;
  }
}

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
              DropdownMenuEntry(value: false, label: "False"),
              DropdownMenuEntry(value: true, label: "True"),
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
              text: "Select document date range",
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
