part of 'staff_widget.dart';

class StaffDataSource extends DataTableSource {
  final List<Staff> data = [];

  final SettingsFilter filter;

  final BuildContext context;

  final VoidCallback rebuild;

  StaffDataSource({
    required this.context,
    required this.filter,
    required this.rebuild,
  });

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final staff = data[index];
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(staff.name),
        ),
        DataCell(
          getCenterText(staff.email),
        ),
        DataCell(
          getCenterText(
            staff.aircraft
                    ?.map(
                      (e) {
                        return e.aircraft!.name;
                      },
                    )
                    .toList()
                    .join(', ') ??
                "",
          ),
        ),
        DataCell(
          getCenterText(
            staff.roles
                    ?.map(
                      (e) {
                        return e.role!.name;
                      },
                    )
                    .toList()
                    .join(', ') ??
                "",
          ),
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
                color: staff.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(staff.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            staff.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    staff.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: getActions(staff),
          ),
        ),
      ],
    );
  }

  Widget getActions(Staff staff) {
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                return staffWidget(context, staff: staff);
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            await Future.wait([
              update(staff.copyWith(archived: !staff.archived)),
              staff.archived ? enableUser(staff.id) : disableUser(staff.id),
            ]);
            rebuild();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await Future.wait([
              deleteStaff(staff),
              deleteUser(staff.id),
            ]);
            rebuild();
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
        document: listStaff,
        variables: {"filter": filter.toJson()},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listStaffResult = jsonMap["listStaff"];
      final List<Map<String, dynamic>> staff;
      listStaffResult == null
          ? staff = []
          : staff = List<Map<String, dynamic>>.from(
              jsonMap["listStaff"]["items"],
            );
      data.clear();
      for (var staff in staff) {
        data.add(Staff.fromJson(staff));
      }
      // notifyListeners();
      // debugPrint("did call fetchRawData");
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchRawData Stafffailed: $e');
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchRawData Staff failed: $e');
    }
  }

  void sort<T>(Comparable<T> Function(Staff staff) getField, bool ascending) {
    data.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  Widget staffWidget(BuildContext context, {Staff? staff}) {
    String name = staff?.name ?? "";
    String email = staff?.email ?? "";
    bool archived = staff?.archived ?? false;
    List<Aircraft> aircraft = staff?.aircraft
            ?.map(
              (e) => e.aircraft!,
            )
            .toList() ??
        [];
    List<Role> roles = staff?.roles
            ?.map(
              (e) => e.role!,
            )
            .toList() ??
        [];
    Map<Subcategory, StaffSubcategory> staffSubcategories = {
      for (var staffSubcategory in staff?.subcategories ?? <StaffSubcategory>[])
        staffSubcategory.subcategory!: staffSubcategory
    };
    final formKey = GlobalKey<FormState>();
    return AlertDialog.adaptive(
      title: staff != null
          ? Text('Editing ${staff.name}')
          : const Text('Add a staff'),
      content: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Staff Name',
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                  initialValue: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter staff name';
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
                    labelText: 'Email of the staff',
                  ),
                  initialValue: email,
                  onChanged: (value) {
                    email = value;
                  },
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
                future: list(Aircraft.classType),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final allAircraft = snapshot.data!.cast<Aircraft>();
                    return MultiSelect(
                      onConfirm: (options) {
                        aircraft = options.cast<Aircraft>();
                      },
                      items: allAircraft.map(
                        (e) {
                          return MultiSelectItem(e, e.name);
                        },
                      ).toList(),
                      initialValue: aircraft,
                    );
                  } else {
                    return const Placeholder();
                  }
                },
              ),
              FutureBuilder(
                future: list(Role.classType),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final allRoles = snapshot.data!.cast<Role>();
                    return MultiSelect(
                      onConfirm: (options) {
                        roles = options.cast<Role>();
                      },
                      items: allRoles.map(
                        (e) {
                          return MultiSelectItem(e, e.name);
                        },
                      ).toList(),
                      initialValue: roles,
                    );
                  } else {
                    return const Placeholder();
                  }
                },
              ),
              FutureBuilder(
                future: list(Subcategory.classType),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final allSubcategories = snapshot.data!.cast<Subcategory>();
                    return StatefulBuilder(
                      builder: (context, setState) => Column(
                        children: [
                          MultiSelect(
                            onConfirm: (options) {
                              staffSubcategories = {
                                for (var newSubcategory
                                    in options.cast<Subcategory>())
                                  newSubcategory:
                                      staffSubcategories[newSubcategory] ??
                                          StaffSubcategory(
                                            accessLevel: 1,
                                            subcategory: newSubcategory,
                                            staff: staff,
                                          )
                              };
                              setState(() {});
                            },
                            items: allSubcategories.map(
                              (e) {
                                return MultiSelectItem(e, e.name);
                              },
                            ).toList(),
                            initialValue: staffSubcategories.keys.toList(),
                          ),
                          ...staffSubcategories.entries.map(
                            (entry) => Container(
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
                                  staffSubcategories[entry.key] =
                                      entry.value.copyWith(
                                    accessLevel: value as int,
                                  );
                                },
                                initialSelection: entry.value.accessLevel,
                                expandedInsets: EdgeInsets.zero,
                                requestFocusOnTap: false,
                                hintText: entry.key.name,
                                label: Text(entry.key.name),
                              ),
                            ),
                          ),
                        ],
                      ),
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
              if (staff != null) {
                Staff newStaff = staff.copyWith(
                  // name: name,
                  archived: archived,
                  // email: email,
                );
                await Future.wait([
                  if (newStaff != staff) update(newStaff),
                  updateAircraftStaff(newStaff, aircraft),
                  updateRoleStaff(newStaff, roles),
                  updateStaffSubcategory(newStaff, staffSubcategories),
                ]);
              } else {
                String id = await createUser(
                  name: name,
                  email: email,
                  tempPassword: "LM00r3??",
                );
                Staff newStaff = Staff(
                  id: id,
                  name: name,
                  archived: archived,
                  email: email,
                );
                await Future.wait([
                  create(newStaff),
                  updateAircraftStaff(newStaff, aircraft),
                  updateRoleStaff(newStaff, roles),
                  updateStaffSubcategory(newStaff, staffSubcategories),
                ]);
              }
              if (!context.mounted) return;
              rebuild();
              Navigator.pop(context, 'Apply');
            }
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
