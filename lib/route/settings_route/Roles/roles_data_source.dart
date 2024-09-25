part of 'roles_widget.dart';

class RolesDataSource extends DataTableSource {
  final List<Role> data = [];

  final SettingsFilter filter;

  final BuildContext context;

  final VoidCallback rebuild;

  RolesDataSource({
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
    final role = data[index];
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
              context: context,
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
            rebuild();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await deleteRole(role);
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
        document: listRoles,
        variables: {"filter": filter.toJson()},
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
      data.clear();
      for (var role in roles) {
        data.add(Role.fromJson(role));
      }
      // debugPrint("did call fetchRawData");
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchRawData Role failed: $e');
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchRawData Role failed: $e');
    }
  }

  void sort<T>(Comparable<T> Function(Role role) getField, bool ascending) {
    data.sort((a, b) {
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
                  return MultiSelect(
                    onConfirm: (p0) {
                      staff = List<Staff>.from(p0);
                    },
                    items: allStaff.map(
                      (e) {
                        return MultiSelectItem(e, e.name);
                      },
                    ).toList(),
                    initialValue: staff,
                    text: "Choose Staff",
                  );
                } else {
                  return const Placeholder();
                }
              },
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
                  if (role != newRole) update(newRole),
                ]);
              } else {
                newRole = await create(newRole);
                await updateRoleStaff(newRole, staff);
              }
              rebuild();
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
