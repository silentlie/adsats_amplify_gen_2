part of 'staff_widget.dart';

class StaffDataSource extends DataTableSource {
  static bool isInitialize = false;

  static final List<Staff> _data = [];

  static final SettingsFilter _filter = SettingsFilter();

  final BuildContext _context;

  StaffDataSource(this._context) {
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
    final staff = _data[index];
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
              context: _context,
              builder: (context) {
                return staffWidget(context, staff: staff);
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            await update(staff.copyWith(archived: !staff.archived));
            fetchRawData();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await delete(staff);
            fetchRawData();
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
        variables: {"filter": _filter.toJson()},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.data == null) {
        throw Exception('No data returned from API');
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listStaffResult = jsonMap["listStaff"];
      final List<Map<String, dynamic>> staff;
      listStaffResult == null
          ? staff = []
          : staff = List<Map<String, dynamic>>.from(
              jsonMap["listStaff"]["items"],
            );
      _data.clear();
      for (var staff in staff) {
        _data.add(Staff.fromJson(staff));
      }
      isInitialize = true;
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(
        'Error Exception while retrieving staff: $e',
      );
      rethrow;
    }
  }

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Staff",
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
                    return staffWidget(context);
                  },
                );
              },
              label: const Text('Add an staff'),
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

  void sort<T>(Comparable<T> Function(Staff staff) getField, bool ascending) {
    _data.sort((a, b) {
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
    final formKey = GlobalKey<FormState>();
    return AlertDialog.adaptive(
      title: staff != null
          ? Text('Editing ${staff.name}')
          : const Text('Add a staff'),
      content: Form(
        key: formKey,
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
          ],
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
              Staff newStaff = staff?.copyWith(
                    name: name,
                    archived: archived,
                    email: email,
                  ) ??
                  Staff(
                    name: name,
                    archived: archived,
                    email: email,
                  );
              if (staff != null) {
                await Future.wait([
                  update(newStaff),
                ]);
              } else {
                await create(newStaff);
              }
              if (!context.mounted) return;
              fetchRawData();
              Navigator.pop(context, 'Apply');
            }
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
