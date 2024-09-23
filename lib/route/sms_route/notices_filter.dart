import 'package:adsats_amplify_gen_2/helper/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/helper/mutable_date_time_range.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';

part 'search_bar_widget.dart';

class NoticesFilter {
  Staff staff;
  String search;
  NoticeType? type;
  NoticeStatus? status;
  bool? archived;
  MutableDateTimeRange noticedAt;
  MutableDateTimeRange deadlineAt;

  NoticesFilter({
    required this.staff,
    this.search = "",
    this.type,
    this.status,
    this.archived,
    MutableDateTimeRange? noticedAt,
    MutableDateTimeRange? deadlineAt,
  })  : noticedAt = noticedAt ?? MutableDateTimeRange(),
        deadlineAt = deadlineAt ?? MutableDateTimeRange();

  NoticesFilter copyWith({
    String? search,
    NoticeType? type,
    NoticeStatus? status,
    bool? archived,
    MutableDateTimeRange? noticedAt,
    MutableDateTimeRange? deadlineAt,
  }) {
    return NoticesFilter(
      staff: staff,
      search: search ?? this.search,
      type: type ?? this.type,
      status: status ?? this.status,
      archived: archived ?? this.archived,
      noticedAt: noticedAt ?? this.noticedAt,
      deadlineAt: deadlineAt ?? this.deadlineAt,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      "staffId": {"eq": staff.id},
      "subject": {"contains": search},
    };
    archived != null ? result["archived"] = {"eq": archived} : null;
    type != null ? result["type"] = {"eq": type!.name} : null;
    status != null ? result["type"] = {"eq": status!.name} : null;
    noticedAt.dateTimeRange != null
        ? result["createdAt"] = {"between": noticedAt.toIso8601String()}
        : null;
    deadlineAt.dateTimeRange != null
        ? result["createdAt"] = {"between": deadlineAt.toIso8601String()}
        : null;
    return result;
  }

  Widget getFilterWidget(BuildContext context, Function fetchRawData) {
    NoticesFilter temp = this;
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: const Text('Filter By:'),
              content: Container(
                // max width of filter column
                constraints: const BoxConstraints(maxWidth: 400, minWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DropdownMenu(
                        dropdownMenuEntries: NoticeType.values.map(
                          (e) {
                            return DropdownMenuEntry(
                                value: e, label: e.name.replaceAll('_', ' '));
                          },
                        ).toList(),
                        onSelected: (value) {
                          temp.type = value;
                        },
                        initialSelection: type,
                        expandedInsets: EdgeInsets.zero,
                        requestFocusOnTap: false,
                        hintText: "Type",
                        label: const Text(
                          "Type",
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DropdownMenu(
                        dropdownMenuEntries: NoticeStatus.values.map(
                          (e) {
                            return DropdownMenuEntry(value: e, label: e.name);
                          },
                        ).toList(),
                        onSelected: (value) {
                          temp.status = value;
                        },
                        initialSelection: status,
                        expandedInsets: EdgeInsets.zero,
                        requestFocusOnTap: false,
                        hintText: "Status",
                        label: const Text(
                          "Status",
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DropdownMenu(
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(value: false, label: "False"),
                          DropdownMenuEntry(value: true, label: "True"),
                          DropdownMenuEntry(value: null, label: "All"),
                        ],
                        onSelected: (value) {
                          temp.archived = value;
                        },
                        initialSelection: archived,
                        expandedInsets: EdgeInsets.zero,
                        requestFocusOnTap: false,
                        hintText: "Archived",
                        label: const Text(
                          "Archived",
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DateTimeRangePicker(
                        timeRange: temp.noticedAt,
                        text: "Select notice date range",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DateTimeRangePicker(
                        timeRange: temp.deadlineAt,
                        text: "Select deadline date range",
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                // cancel
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    type = null;
                    status = null;
                    archived = false;
                    noticedAt = MutableDateTimeRange();
                    deadlineAt = MutableDateTimeRange();
                    fetchRawData();
                    Navigator.pop(context, 'Apply');
                  },
                  child: const Text("Reset filter"),
                ),
                // apply
                TextButton(
                  onPressed: () {
                    type = temp.type;
                    status = temp.status;
                    archived = temp.archived;
                    noticedAt = temp.noticedAt;
                    deadlineAt = temp.deadlineAt;
                    fetchRawData();
                    Navigator.pop(context, 'Apply');
                  },
                  child: const Text('Apply'),
                )
              ],
            );
          },
        );
      },
      child: const Text("Filter By"),
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
