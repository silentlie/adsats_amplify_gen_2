import 'package:adsats_amplify_gen_2/helper/between_date_range.dart';
import 'package:adsats_amplify_gen_2/helper/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';
part 'filter.freezed.dart';

@Riverpod(dependencies: [])
class AircraftFilter extends _$AircraftFilter {
  @override
  AircraftFilterState build() {
    return AircraftFilterState();
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(AircraftFilterState newState) {
    state = newState;
  }
}

@freezed
class AircraftFilterState with _$AircraftFilterState {
  AircraftFilterState._();
  factory AircraftFilterState({
    @Default("") String search,
    @Default(false) bool? archived,
    DateTimeRange? createdAt,
  }) = _AircraftFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    search.isNotEmpty ? result["name"] = {"contains": search} : null;
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {"between": betweenDateRange(createdAt!)}
        : null;
    return result;
  }
}

class AircraftFilterView extends ConsumerWidget {
  const AircraftFilterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(aircraftFilterProvider);
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
              text: "Select aircraft created date range",
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
            ref.invalidate(aircraftFilterProvider);
            Navigator.pop(context);
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref.read(aircraftFilterProvider.notifier).apply(filter);
            Navigator.pop(context);
          },
          child: const Text('Apply'),
        )
      ],
    );
  }
}
