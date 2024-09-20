part of 'subcategories_widget.dart';

class SubcategoriesDataSource extends DataTableSource {
  static bool isInitialize = false;

  static final List<Subcategory> _data = [];

  static final SettingsFilter _filter = SettingsFilter();

  final BuildContext _context;

  SubcategoriesDataSource(this._context) {
    if (!isInitialize) {
      _filter.archived = false;
    }
  }

  @override
  int get rowCount => _data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final subcategory = _data[index];
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(subcategory.name),
        ),
        DataCell(
          getCenterText(subcategory.description ?? ""),
        ),
        DataCell(
          getCenterText(subcategory.category?.name ?? ""),
        ),
        DataCell(
          Center(
            child: Container(
              width: 60,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                // maybe make it follow color scheme
                color:
                    subcategory.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(subcategory.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            subcategory.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    subcategory.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: getActions(subcategory),
          ),
        ),
      ],
    );
  }

  Widget getActions(Subcategory subcategory) {
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            showDialog(
              context: _context,
              builder: (context) {
                return subcategoryWidget(context, subcategory: subcategory);
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            await update(subcategory.copyWith(archived: !subcategory.archived));
            await fetchRawData();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await deleteSubcategory(subcategory);
            await fetchRawData();
          },
          icon: const Icon(Icons.delete_outline),
        ),
      ],
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(
            Icons.more_vert,
            // size: 20,
          ),
        );
      },
    );
  }

  Future<void> fetchRawData() async {
    try {
      final request = GraphQLRequest<String>(
        document: listSubcategories,
        variables: {"filter": _filter.toJson()},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listSubcategoriesResult = jsonMap["listSubcategories"];
      final List<Map<String, dynamic>> subcategories;
      listSubcategoriesResult == null
          ? subcategories = []
          : subcategories = List<Map<String, dynamic>>.from(
              jsonMap["listSubcategories"]["items"],
            );
      _data.clear();
      for (var subcategory in subcategories) {
        _data.add(Subcategory.fromJson(subcategory));
      }
      isInitialize = true;
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(
        'Error Exception while retrieving subcategories: $e',
      );
      rethrow;
    }
  }

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Subcategories",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 5),
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                fetchRawData();
              },
              icon: const Icon(Icons.refresh),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: _context,
                  builder: (context) {
                    return subcategoryWidget(context);
                  },
                );
              },
              label: const Text('Add an subcategory'),
              icon: const Icon(
                Icons.add,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            _filter.getFilterWidget(_context, fetchRawData),
            const SizedBox(
              width: 10,
            ),
            SearchBarWidget(filter: _filter, fetchRawData: fetchRawData)
          ],
        ),
      ),
    );
  }

  void sort<T>(Comparable<T> Function(Subcategory subcategory) getField,
      bool ascending) {
    _data.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  Widget subcategoryWidget(BuildContext context, {Subcategory? subcategory}) {
    if (!CategoriesDataSource.isInitialize) {
      CategoriesDataSource(context).fetchRawData();
    }
    Category? category;
    String name = subcategory?.name ?? "";
    String description = subcategory?.description ?? "";
    bool archived = subcategory?.archived ?? false;
    List<StaffSubcategory> staffSubcategories =
        List.of(subcategory?.staff ?? []);
    final formKey = GlobalKey<FormState>();
    return AlertDialog.adaptive(
      title: subcategory != null
          ? Text('Editing ${subcategory.name}')
          : const Text('Add a subcategory'),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder(
                future: list(Category.classType),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    category = subcategory == null
                        ? snapshot.data!.firstOrNull
                        : subcategory.category;
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: DropdownMenu(
                        dropdownMenuEntries: snapshot.data!.map(
                          (e) {
                            return DropdownMenuEntry(value: e, label: e.name);
                          },
                        ).toList(),
                        onSelected: (value) {
                          category = value!;
                        },
                        initialSelection: category,
                        expandedInsets: EdgeInsets.zero,
                        requestFocusOnTap: false,
                        hintText: "Category",
                        label: const Text(
                          "Category",
                        ),
                      ),
                    );
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Subcategory Name',
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                  initialValue: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter subcategory name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 666),
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description of the subcategory',
                  ),
                  initialValue: description,
                  onChanged: (value) {
                    description = value;
                  },
                  maxLines: 4,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: DropdownMenu(
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: false, label: "False"),
                    DropdownMenuEntry(value: true, label: "True"),
                  ],
                  onSelected: (value) {
                    archived = value!;
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
              FutureBuilder(
                future: list(Staff.classType),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final allStaff = snapshot.data as List<Staff>;
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Column(
                          children: [
                            MultiSelect(
                              onConfirm: (options) {
                                setState(() {
                                  List<Staff> selectedStaff =
                                      List<Staff>.from(options);
                                  staffSubcategories.removeWhere(
                                    (staffSubcategory) => !selectedStaff
                                        .contains(staffSubcategory.staff),
                                  );
                                  for (var staff in selectedStaff) {
                                    if (!staffSubcategories
                                        .any((s) => s.staff == staff)) {
                                      staffSubcategories.add(StaffSubcategory(
                                        accessLevel: 1,
                                        staff: staff,
                                        subcategory: subcategory,
                                      ));
                                    }
                                  }
                                });
                              },
                              items: allStaff.map((e) {
                                return MultiSelectItem(e, e.name);
                              }).toList(),
                              initialValue:
                                  staffSubcategories.map((e) => e.staff).toList(),
                            ),
                            ...staffSubcategories.map(
                              (staffSubcategory) {
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  child: DropdownMenu(
                                    dropdownMenuEntries: const [
                                      DropdownMenuEntry(
                                        value: 1,
                                        label: "Read-only",
                                      ),
                                      DropdownMenuEntry(
                                        value: 2,
                                        label: "Full-access",
                                      ),
                                    ],
                                    onSelected: (value) {
                                      final index = staffSubcategories
                                          .indexOf(staffSubcategory);
                                      staffSubcategories[index] =
                                          staffSubcategory.copyWith(
                                        accessLevel: value as int,
                                      );
                                    },
                                    initialSelection:
                                        staffSubcategory.accessLevel,
                                    expandedInsets: EdgeInsets.zero,
                                    requestFocusOnTap: false,
                                    hintText: staffSubcategory.staff!.name,
                                    label: Text(staffSubcategory.staff!.name),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Placeholder();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              Subcategory newSubcategory = subcategory?.copyWith(
                      name: name,
                      archived: archived,
                      description: description,
                      category: category!) ??
                  Subcategory(
                      name: name,
                      archived: archived,
                      description: description,
                      category: category!);
              if (subcategory != null) {
                await Future.wait([
                  if (newSubcategory != subcategory) update(newSubcategory),
                  updateStaffSubcategory(subcategory.staff!, staffSubcategories)
                ]);
              } else {
                await Future.wait([
                  create(newSubcategory),
                  updateStaffSubcategory(
                      [],
                      staffSubcategories
                          .map(
                            (e) => e.copyWith(subcategory: newSubcategory),
                          )
                          .toList()),
                ]);
              }
              await fetchRawData();
              if (!context.mounted) return;
              Navigator.pop(context, 'Apply');
            }
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
