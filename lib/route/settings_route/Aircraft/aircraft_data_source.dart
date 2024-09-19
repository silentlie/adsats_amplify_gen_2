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
            await fetchRawData();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await deleteAicraft(aircraft);
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
        document: listAircraft,
        variables: {"filter": _filter.toJson()},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listAircraftResult = jsonMap["listAircraft"];
      final List<Map<String, dynamic>> aircraft;
      listAircraftResult == null
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
      // debugPrint("did call fetchRawData");
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchRawData Aircraft failed: $e');
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchRawData Aircraft failed: $e');
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
    List<Staff> staff = aircraft?.staff?.map((e) => e.staff!).toList() ?? [];
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
                  updateAircraftStaff(newAircraft, staff),
                  if (aircraft != newAircraft) update(newAircraft),
                ]);
              } else {
                newAircraft = await create(newAircraft);
                await updateAircraftStaff(newAircraft, staff);
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
