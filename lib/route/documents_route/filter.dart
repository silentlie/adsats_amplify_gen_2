import 'package:adsats_amplify_gen_2/helper/between_date_range.dart';
import 'package:adsats_amplify_gen_2/helper/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/models/Subcategory.dart';
import 'package:flutter/material.dart';

class Filter {
  String search;
  bool? archived;
  Subcategory subcategory;
  DateTimeRange? createdAt;
  Filter({
    this.search = "",
    this.archived,
    required this.subcategory,
    this.createdAt,
  });
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

  Widget getFilterWidget(
      BuildContext context, void Function(VoidCallback) setState) {
    Filter temp = this;
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: const Text('Filter By:'),
              content: Container(
                // max width of filter column
                constraints: const BoxConstraints(maxWidth: 400),
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
                    setState(
                      () {},
                    );
                    Navigator.pop(context, 'Apply');
                  },
                  child: const Text("Reset filter"),
                ),
                // apply
                TextButton(
                  onPressed: () {
                    archived = temp.archived;
                    createdAt = temp.createdAt;
                    setState(
                      () {},
                    );
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
}
