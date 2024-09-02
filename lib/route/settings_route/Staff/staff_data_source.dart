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
            // await getFileUrl(aircraft);
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            // await archive(aircraft);
            fetchRawData();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            // await delete(aircraft);
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
    const graphQLDocument = '''
      query ListStaff(\$filter: ModelStaffFilterInput) {
        listStaff(filter: \$filter) {
          items {
            id
            name
            email
            aircraft {
              items {
                aircraftId
                createdAt
                id
                staffId
                updatedAt
                aircraft {
                  archived
                  createdAt
                  description
                  id
                  name
                  updatedAt
                }
              }
            }
            roles {
              items {
                id
                createdAt
                staffId
                updatedAt
                roleId
                role {
                  archived
                  createdAt
                  description
                  name
                  id
                  updatedAt
                }
              }
            }
            createdAt
            archived
            subcategories {
              items {
                accessLevel
                createdAt
                id
                staffId
                subcategoryId
                updatedAt
                subcategory {
                  archived
                  categoryId
                  createdAt
                  description
                  id
                  name
                  updatedAt
                }
              }
            }
            updatedAt
          }
        }
      }
    ''';

    final request = GraphQLRequest<String>(
      document: graphQLDocument,
      variables: {"filter": _filter.toJson()},
    );

    try {
      final response = await Amplify.API.query(request: request).response;
      if (response.data == null) {
        throw Exception('No data returned from API');
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listStaff = jsonMap["listStaff"];
      final List<Map<String, dynamic>> staff;
      listStaff == null
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
            // ElevatedButton.icon(
            //   onPressed: () {
            //     _context.go('/add-a-document');
            //   },
            //   label: const Text('Add a document'),
            //   icon: const Icon(
            //     Icons.add,
            //     size: 25,
            //   ),
            // ),
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
}
