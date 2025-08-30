import 'package:adsats_amplify_gen_2/helper/extensions/iso_between.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/widgets/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';
part 'filter.freezed.dart';

@Riverpod(dependencies: [])
class FlightCrewRecordFilter extends _$FlightCrewRecordFilter {
  @override
  FlightCrewRecordFilterState build(
    Staff staff,
    FlightCrewRecordCategory category,
  ) {
    return FlightCrewRecordFilterState(staff: staff, category: category);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(FlightCrewRecordFilterState newState) {
    state = newState;
  }
}

@freezed
sealed class FlightCrewRecordFilterState with _$FlightCrewRecordFilterState {
  FlightCrewRecordFilterState._();
  factory FlightCrewRecordFilterState({
    required final Staff staff,
    required final FlightCrewRecordCategory category,
    @Default("") String search,
    @Default(false) bool? archived,
    DateTimeRange? createdAt,
    DateTimeRange? issuedAt,
    DateTimeRange? expiredAt,
  }) = _FlightCrewRecordFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {
      "staffId": {"eq": staff.id},
      "categoryId": {"eq": category.id},
    };
    search.isNotEmpty ? result["name"] = {"contains": search} : null;
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {"between": createdAt!.isoBetween}
        : null;
    issuedAt != null
        ? result["issuedAt"] = {"between": issuedAt!.isoBetween}
        : null;
    expiredAt != null
        ? result["expiredAt"] = {"between": expiredAt!.isoBetween}
        : null;
    return result;
  }
}

class FlightCrewRecordFilterView extends ConsumerWidget {
  const FlightCrewRecordFilterView({
    super.key,
    required this.staff,
    required this.category,
  });
  final Staff staff;
  final FlightCrewRecordCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(flightCrewRecordFilterProvider(staff, category));
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
              text: "Select record uploaded time range",
              onSubmitted: (value) {
                filter = filter.copyWith(createdAt: value);
              },
              initialDateRange: filter.createdAt,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: DateTimeRangePicker(
              text: "Select document issued time range",
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
              text: "Select document expired time range",
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
            ref.invalidate(flightCrewRecordFilterProvider);
            Navigator.pop(context);
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref
                .read(flightCrewRecordFilterProvider(staff, category).notifier)
                .apply(filter);
            Navigator.pop(context);
          },
          child: const Text('Apply'),
        )
      ],
    );
  }
}
