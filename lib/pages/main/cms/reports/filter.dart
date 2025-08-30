import 'package:adsats_amplify_gen_2/auth/auth.dart';
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

@Riverpod(dependencies: [userDetails])
class ReportFilter extends _$ReportFilter {
  @override
  ReportFilterState build() {
    final user = ref.watch(userDetailsProvider).value!;
    return ReportFilterState(user: user, archived: false);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(ReportFilterState newState) {
    state = newState;
  }
}

@freezed
sealed class ReportFilterState with _$ReportFilterState {
  ReportFilterState._();
  factory ReportFilterState({
    required Staff user,
    @Default("") String search,
    ReportType? type,
    ReportStatus? status,
    bool? archived,
    DateTimeRange? reportedAt,
  }) = _ReportFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    search.isNotEmpty ? result["subject"] = {"contains": search} : null;

    archived != null ? result["archived"] = {"eq": archived} : null;
    type != null ? result["type"] = {"eq": type!.name} : null;
    status != null ? result["status"] = {"eq": status!.name} : null;
    reportedAt != null
        ? result["createdAt"] = {"between": reportedAt!.isoBetween}
        : null;
    return result;
  }
}

class ReportsFilterView extends ConsumerWidget {
  const ReportsFilterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(reportFilterProvider);
    return AlertDialog.adaptive(
      title: const Text('Filter By:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalDropdownMenu<ReportType>(
            entries: ReportType.values.map(
              (e) {
                return DropdownMenuEntry(
                    value: e, label: e.name.replaceAll('_', ' '));
              },
            ).toList(),
            onSelected: (value) {
              filter = filter.copyWith(type: value);
            },
            initialSelection: filter.type,
            text: "Report Type",
          ),
          GlobalDropdownMenu<ReportStatus>(
            entries: ReportStatus.values.map(
              (e) {
                return DropdownMenuEntry(value: e, label: e.name);
              },
            ).toList(),
            onSelected: (value) {
              filter = filter.copyWith(status: value);
            },
            initialSelection: filter.status,
            text: "Report Status",
          ),
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
              text: "Select report date range",
              onSubmitted: (value) {
                filter = filter.copyWith(reportedAt: value);
              },
              initialDateRange: filter.reportedAt,
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
            ref.invalidate(reportFilterProvider);
            Navigator.pop(context);
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref.read(reportFilterProvider.notifier).apply(filter);
            Navigator.pop(context);
          },
          child: const Text('Apply'),
        )
      ],
    );
  }
}
