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
}
