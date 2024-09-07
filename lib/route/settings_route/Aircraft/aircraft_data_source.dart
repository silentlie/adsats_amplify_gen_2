part of 'aircraft_widget.dart';

class AircraftDataSource extends DataTableSource {
  static bool isInitialize = false;

  static final List<Aircraft> _data = [];

  static final SettingsFilter _filter = SettingsFilter();

  final BuildContext _context;

  AircraftDataSource(this._context) {
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
    final aircraft = _data[index];
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(aircraft.name),
        ),
        DataCell(
          getCenterText(aircraft.description ?? ""),
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
                color: aircraft.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(aircraft.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            aircraft.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    aircraft.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: getActions(aircraft),
          ),
        ),
      ],
    );
  }

  Widget getActions(Aircraft aircraft) {
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            showDialog(
              context: _context,
              builder: (context) {
                return aircraftWidget(context, aircraft: aircraft);
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            await update(aircraft.copyWith(archived: !aircraft.archived));
            fetchRawData();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await delete(aircraft);
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
      query ListAircraft(\$filter: ModelAircraftFilterInput) {
        listAircraft(filter: \$filter) {
          items {
            id
            name
            description
            createdAt
            archived
            updatedAt
            staff {
              items {
                aircraftId
                createdAt
                staffId
                updatedAt
                id
                staff {
                  archived
                  createdAt
                  id
                  email
                  name
                  updatedAt
                }
              }
            }
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
      final listAircraft = jsonMap["listAircraft"];
      final List<Map<String, dynamic>> aircraft;
      listAircraft == null
          ? aircraft = []
          : aircraft = List<Map<String, dynamic>>.from(
              jsonMap["listAircraft"]["items"],
            );
      _data.clear();
      for (var aircraft in aircraft) {
        _data.add(Aircraft.fromJson(aircraft));
      }
      isInitialize = true;
      notifyListeners();
      debugPrint("did call fetchRawData");
    } on Exception catch (e) {
      debugPrint(
        'Error Exception while retrieving aircraft: $e',
      );
      rethrow;
    }
  }

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Aircraft",
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
                    return aircraftWidget(context);
                  },
                );
              },
              label: const Text('Add an aircraft'),
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

  void sort<T>(
      Comparable<T> Function(Aircraft aircraft) getField, bool ascending) {
    _data.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  Widget aircraftWidget(BuildContext context, {Aircraft? aircraft}) {
    String name = aircraft?.name ?? "";
    String description = aircraft?.description ?? "";
    bool archived = aircraft?.archived ?? false;
    List<AircraftStaff> staff = aircraft?.staff ?? [];
    final formKey = GlobalKey<FormState>();
    return AlertDialog.adaptive(
      title: aircraft != null
          ? Text('Editing ${aircraft.name}')
          : const Text('Add an aircraft'),
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
                  labelText: 'Aircraft Name',
                ),
                onChanged: (value) {
                  name = value;
                },
                initialValue: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter aircraft name';
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
                  labelText: 'Description of the aircraft',
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
            if (aircraft != null)
              MultiSelect(
                onConfirm: (p0) {
                  staff = List<Staff>.from(p0).map(
                    (e) {
                      return AircraftStaff(aircraft: aircraft, staff: e);
                    },
                  ).toList();
                },
                items: Provider.of<AuthNotifier>(
                  context,
                  listen: false,
                ).staff.map(
                  (e) {
                    return MultiSelectItem(e, e.name);
                  },
                ).toList(),
                initialValue: staff.map(
                  (e) {
                    return e.staff!;
                  },
                ).toList(),
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
              Aircraft newAircraft = aircraft?.copyWith(
                    name: name,
                    archived: archived,
                    description: description,
                  ) ??
                  Aircraft(
                    name: name,
                    archived: archived,
                    description: description,
                  );
              if (aircraft != null) {
                await Future.wait([
                  deleteAircraftStaff(aircraft.staff ?? []),
                  createAircraftStaff(staff),
                  update(newAircraft),
                ]);
              } else {
                await create(newAircraft);
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
