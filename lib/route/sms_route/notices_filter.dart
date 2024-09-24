import 'package:adsats_amplify_gen_2/helper/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';

class NoticesFilter {
  Staff staff;
  String search;
  NoticeType? type;
  NoticeStatus? status;
  bool? archived;
  DateTimeRange? noticedAt;
  DateTimeRange? deadlineAt;

  NoticesFilter({
    Staff? staff,
    this.search = "",
    this.type,
    this.status,
    this.archived,
    this.noticedAt,
    this.deadlineAt,
  }) : staff = staff ?? Staff(name: "", email: "", archived: false);

  NoticesFilter copyWith({
    String? search,
    NoticeType? type,
    NoticeStatus? status,
    bool? archived,
    DateTimeRange? noticedAt,
    DateTimeRange? deadlineAt,
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
    Map<String, dynamic> result = {};
    search.isNotEmpty ? result["subject"] = {"contains": search} : null;

    archived != null ? result["archived"] = {"eq": archived} : null;
    type != null ? result["type"] = {"eq": type!.name} : null;
    status != null ? result["type"] = {"eq": status!.name} : null;
    noticedAt != null
        ? result["createdAt"] = {
            "between":
                "${noticedAt!.start.toIso8601String()},${noticedAt!.end.toIso8601String()}"
          }
        : null;
    deadlineAt != null
        ? result["createdAt"] = {
            "between":
                "${deadlineAt!.start.toIso8601String()},${deadlineAt!.end.toIso8601String()}"
          }
        : null;
    return result;
  }

  Widget getFilterWidget(BuildContext context, VoidCallback rebuild) {
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
                        text: "Select notice date range",
                        onSubmitted: (value) => temp.noticedAt = value,
                        initialDateRange: temp.noticedAt,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: DateTimeRangePicker(
                        text: "Select deadline date range",
                        onSubmitted: (value) => temp.deadlineAt = value,
                        initialDateRange: temp.deadlineAt,
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
                    noticedAt = null;
                    deadlineAt = null;
                    rebuild();
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
                    rebuild();
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
