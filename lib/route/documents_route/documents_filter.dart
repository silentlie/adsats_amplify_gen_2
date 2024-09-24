part of 'documents_widget.dart';

class DocumentsFilter {
  String search;
  bool? archived;
  Iterable<Subcategory> subcategories;
  DateTimeRange? createdAt;

  DocumentsFilter({
    this.search = "",
    this.archived,
    this.subcategories = const [],
    this.createdAt,
  });

  DocumentsFilter copyWith({
    String? search,
    bool? archived,
    List<Subcategory>? subcategories,
    DateTimeRange? createdAt,
  }) {
    return DocumentsFilter(
      search: search ?? this.search,
      archived: archived ?? this.archived,
      subcategories: subcategories ?? this.subcategories,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};
    search.isNotEmpty ? result["name"] = {"contains": search} : null;
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {
            "between":
                "${createdAt!.start.toIso8601String()},${createdAt!.end.toIso8601String()}"
          }
        : null;
    result["or"] = subcategories
        .map(
          (e) => {
            "subcategoryId": {"eq": e.id}
          },
        )
        .toList();
    return result;
  }

  Widget getFilterWidget(BuildContext context, VoidCallback rebuild) {
    DocumentsFilter temp = this;
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
            return AlertDialog.adaptive(
              title: const Text('Filter By:'),
              content: Container(
                // max width of filter column
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MultiSelect(
                      buttonText: const Text("Filter by subcategories"),
                      title: const Text("Filter by subcategories"),
                      items: authNotifier.user.subcategories?.map(
                            (entry) {
                              return MultiSelectItem(
                                entry.subcategory!,
                                entry.subcategory!.name,
                              );
                            },
                          ).toList() ??
                          [],
                      onConfirm: (selectedOptions) {
                        temp.subcategories =
                            List<Subcategory>.from(selectedOptions);
                      },
                      initialValue: subcategories.toList(),
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
                    subcategories = authNotifier.user.subcategories
                            ?.map((e) => e.subcategory!)
                            .toList() ??
                        [];
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
                    subcategories = temp.subcategories;
                    createdAt = temp.createdAt;
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
