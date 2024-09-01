part of 'document_widget.dart';

class DocumentsFilter {
  String search;
  bool? archived;
  List<Subcategory> subcategories;
  MutableDateTimeRange createdAt;

  DocumentsFilter({
    this.search = "",
    this.archived,
    this.subcategories = const [],
    MutableDateTimeRange? createdAt,
  }) : createdAt = createdAt ?? MutableDateTimeRange();

  DocumentsFilter copyWith({
    String? search,
    bool? archived,
    List<Subcategory>? subcategories,
    MutableDateTimeRange? createdAt,
  }) {
    return DocumentsFilter(
      search: search ?? this.search,
      archived: archived ?? this.archived,
      subcategories: subcategories ?? this.subcategories,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      "name": {"contains": search},
    };
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt.dateTimeRange != null
        ? result["createdAt"] = {"between": createdAt.toIso8601String()}
        : null;
    result["or"] = subcategories.map(
      (e) {
        return {
          "subcategoryId": {"eq": e.id}
        };
      },
    ).toList();
    return result;
  }

  Widget getFilterWidget(BuildContext context, Function fetchRawData) {
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
                constraints: const BoxConstraints(maxWidth: 400, minWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MultiSelect(
                      buttonText: const Text("Filter by subcategories"),
                      title: const Text("Filter by subcategories"),
                      items: authNotifier.user.subcategories?.map(
                            (entry) {
                              return MultiSelectItem(
                                entry.subcategory,
                                entry.subcategory!.name,
                              );
                            },
                          ).toList() ??
                          [],
                      onConfirm: (selectedOptions) {
                        temp.subcategories =
                            List<Subcategory>.from(selectedOptions);
                      },
                      initialValue: subcategories,
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
                        timeRange: temp.createdAt,
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
                // apply
                TextButton(
                  onPressed: () {
                    archived = temp.archived;
                    subcategories = temp.subcategories;
                    createdAt = temp.createdAt;
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
