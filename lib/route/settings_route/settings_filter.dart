import 'package:adsats_amplify_gen_2/helper/date_range_picker.dart';
import 'package:flutter/material.dart';

class SettingsFilter {
  String search;
  bool? archived;
  DateTimeRange? createdAt;

  SettingsFilter({
    this.search = "",
    this.archived,
    this.createdAt,
  });

  SettingsFilter copyWith({
    String? search,
    bool? archived,
    DateTimeRange? createdAt,
  }) {
    return SettingsFilter(
      search: search ?? this.search,
      archived: archived ?? this.archived,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      "name": {"contains": search},
    };
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {
            "between":
                "${createdAt!.start.toIso8601String()},${createdAt!.end.toIso8601String()}"
          }
        : null;
    return result;
  }

  Widget getFilterWidget(BuildContext context, VoidCallback rebuild) {
    SettingsFilter temp = this;
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: const Text('Filter By:'),
              actions: [
                // cancel
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    archived = false;
                    createdAt = null;
                    rebuild();
                    Navigator.pop(context, 'Apply');
                  },
                  child: const Text("Reset filter"),
                ),
                // apply
                TextButton(
                  onPressed: () {
                    archived = temp.archived;
                    createdAt = temp.createdAt;
                    rebuild();
                    Navigator.pop(context, 'Apply');
                  },
                  child: const Text('Apply'),
                )
              ],
              content: Container(
                constraints: const BoxConstraints(maxWidth: 400, minWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                        onSubmitted: (value) => temp.createdAt = value,
                        initialDateRange: temp.createdAt,
                      ),
                    ),
                  ],
                ),
              ),
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
