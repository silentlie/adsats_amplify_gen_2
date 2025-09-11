import 'package:adsats_amplify_gen_2/helper/extensions/iso_between.dart';
import 'package:adsats_amplify_gen_2/widgets/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';
part 'filter.freezed.dart';

@Riverpod()
class FlightCrewRecordCategoriesFilter
    extends _$FlightCrewRecordCategoriesFilter {
  @override
  FlightCrewRecordCategoriesFilterState build(String roleId) {
    return FlightCrewRecordCategoriesFilterState(roleId: roleId);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(FlightCrewRecordCategoriesFilterState newState) {
    state = newState;
  }
}

@freezed
sealed class FlightCrewRecordCategoriesFilterState
    with _$FlightCrewRecordCategoriesFilterState {
  FlightCrewRecordCategoriesFilterState._();
  factory FlightCrewRecordCategoriesFilterState({
    @Default("") String search,
    @Default(false) bool? archived,
    DateTimeRange? createdAt,
    required String roleId,
  }) = _FlightCrewRecordCategoriesFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    search.isNotEmpty ? result["name"] = {"contains": search} : null;
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {"between": createdAt!.isoBetween}
        : null;
    return result;
  }
}

class FlightCrewRecordCategoriesFilterView extends ConsumerWidget {
  const FlightCrewRecordCategoriesFilterView({
    super.key,
    required this.roleId,
  });

  final String roleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(flightCrewRecordCategoriesFilterProvider(roleId));
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
            ref.invalidate(flightCrewRecordCategoriesFilterProvider);
            Navigator.pop(context);
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref
                .read(flightCrewRecordCategoriesFilterProvider(roleId).notifier)
                .apply(filter);
            Navigator.pop(context);
          },
          child: const Text('Apply'),
        )
      ],
    );
  }
}
