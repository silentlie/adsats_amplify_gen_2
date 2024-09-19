part of 'roles_widget.dart';

class RolesDataSource extends DataTableSource {
  static bool isInitialize = false;

  static final List<Role> _data = [];

  static final SettingsFilter _filter = SettingsFilter();

  final BuildContext _context;

  RolesDataSource(this._context) {
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
    final role = _data[index];
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(role.name),
        ),
        DataCell(
          getCenterText(role.description ?? ""),
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
                color: role.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(role.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            role.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    role.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: getActions(role),
          ),
        ),
      ],
    );
  }

  Widget getActions(Role role) {
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            showDialog(
              context: _context,
              builder: (context) {
                return roleWidget(context, role: role);
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            await update(role.copyWith(archived: !role.archived));
            fetchRawData();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await delete(role);
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
        document: listRoles,
        variables: {"filter": _filter.toJson()},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listRolesResult = jsonMap["listRoles"];
      final List<Map<String, dynamic>> roles;
      listRolesResult == null
          ? roles = []
          : roles = List<Map<String, dynamic>>.from(
              listRolesResult["items"],
            );
      _data.clear();
      for (var role in roles) {
        _data.add(Role.fromJson(role));
      }
      isInitialize = true;
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(
        'Error Exception while retrieving roles: $e',
      );
      rethrow;
    }
  }

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Roles",
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
                    return roleWidget(context);
                  },
                );
              },
              label: const Text('Add an role'),
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

  void sort<T>(Comparable<T> Function(Role role) getField, bool ascending) {
    _data.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  Widget roleWidget(BuildContext context, {Role? role}) {
    String name = role?.name ?? "";
    String description = role?.description ?? "";
    bool archived = role?.archived ?? false;
    List<Staff> staff = role?.staff?.map((e) => e.staff!).toList() ?? [];
    final formKey = GlobalKey<FormState>();
    return AlertDialog.adaptive(
      title: role != null
          ? Text('Editing ${role.name}')
          : const Text('Create a role'),
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
                  labelText: 'Role Name',
                ),
                onChanged: (value) {
                  name = value;
                },
                initialValue: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter role name';
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
                  labelText: 'Description of the role',
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
            MultiSelect(
              onConfirm: (p0) {
                staff = List<Staff>.from(p0);
              },
              items: Provider.of<AuthNotifier>(
                context,
                listen: false,
              ).staff.map(
                (e) {
                  return MultiSelectItem(e, e.name);
                },
              ).toList(),
              initialValue: staff,
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
              Role newRole = role?.copyWith(
                    name: name,
                    archived: archived,
                    description: description,
                  ) ??
                  Role(
                    name: name,
                    archived: archived,
                    description: description,
                  );
              if (role != null) {
                await Future.wait([
                  updateRoleStaff(role, staff),
                  if (role == newRole) update(newRole),
                ]);
              } else {
                await create(newRole);
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
