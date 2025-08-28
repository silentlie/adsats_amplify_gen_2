import 'package:adsats_amplify_gen_2/helper/extensions/iso_between.dart';
import 'package:adsats_amplify_gen_2/widgets/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';
part 'filter.freezed.dart';

@Riverpod(dependencies: [])
class StaffKPIFilter extends _$StaffKPIFilter {
  @override
  StaffKPIFilterState build() {
    return StaffKPIFilterState(archived: false);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(StaffKPIFilterState newState) {
    state = newState;
  }
}

@freezed
sealed class StaffKPIFilterState with _$StaffKPIFilterState {
  StaffKPIFilterState._();
  factory StaffKPIFilterState({
    @Default("") String search,
    bool? archived,
    DateTimeRange? timeRange,
  }) = _StaffKPIFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variables = {};
    if (search.isNotEmpty) {
      variables["staffFilter"] = {
        "name": {"contains": search},
      };
    }
    if (archived != null) {
      variables.putIfAbsent("staffFilter", () => {})["archived"] = {
        "eq": archived,
      };
    }
    if (timeRange != null) {
      variables["noticeFilter"] = {
        "createdAt": {"between": timeRange!.isoBetween}
      };
      variables["reportFilter"] = {
        "createdAt": {"between": timeRange!.isoBetween}
      };
    }
    return variables;
  }
}

class StaffKPIFilterView extends ConsumerWidget {
  const StaffKPIFilterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(staffKPIFilterProvider);
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
              text: "Select date range",
              onSubmitted: (value) {
                filter = filter.copyWith(timeRange: value);
              },
              initialDateRange: filter.timeRange,
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
            ref.invalidate(staffKPIFilterProvider);
            Navigator.pop(context);
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref.read(staffKPIFilterProvider.notifier).apply(filter);
            Navigator.pop(context);
          },
          child: const Text('Apply'),
        )
      ],
    );
  }
}
