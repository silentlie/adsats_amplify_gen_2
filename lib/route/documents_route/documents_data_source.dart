part of 'documents_widget.dart';

class DocumentsDataSource extends DataTableSource {
  static bool isInitialize = false;

  static final List<Document> _data = [];

  static final DocumentsFilter _filter = DocumentsFilter();

  final BuildContext _context;

  DocumentsDataSource(this._context) {
    if (!isInitialize) {
      _filter.archived = false;
      _filter.subcategories = Provider.of<AuthNotifier>(_context)
              .user
              .subcategories
              ?.map(
                (e) => e.subcategory!,
              )
              .toList() ??
          [];
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
    final document = _data[index];
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(document.name),
        ),
        DataCell(
          getCenterText(
            document.aircraft?.map((e) => e.aircraft?.name).join(', ') ?? "",
          ),
        ),
        DataCell(
          getCenterText(document.subcategory?.name ?? ""),
        ),
        DataCell(
          getCenterText(document.subcategory?.category?.name ?? ""),
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
                color: document.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(document.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            document.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    document.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: getActions(document),
          ),
        ),
      ],
    );
  }

  Widget getActions(Document document) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(
      _context,
      listen: false,
    );
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            await getFileUrl(document);
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
        ),
        if (authNotifier.isAdmin || authNotifier.isEditor)
          IconButton(
            onPressed: () async {
              await archive(document);
              fetchRawData();
            },
            icon: const Icon(Icons.archive_outlined),
          ),
        if (authNotifier.isAdmin)
          IconButton(
            onPressed: () async {
              await delete(document);
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
    final request = GraphQLRequest<String>(
      document: listDocuments,
      variables: {"filter": _filter.toJson()},
    );

    try {
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listDocuments = jsonMap["listDocuments"];
      final List<Map<String, dynamic>> documents;
      listDocuments == null
          ? documents = []
          : documents = List<Map<String, dynamic>>.from(
              jsonMap["listDocuments"]["items"],
            );
      _data.clear();
      for (var document in documents) {
        _data.add(Document.fromJson(document));
      }
      isInitialize = true;
      notifyListeners();
      // debugPrint("did call fetchRawData");
    } on Exception catch (e) {
      debugPrint(
        'Error Exception while retrieving documents: $e',
      );
      rethrow;
    }
  }

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Documents",
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
                _context.go('/add-a-document');
              },
              label: const Text('Add a document'),
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
      Comparable<T> Function(Document document) getField, bool ascending) {
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
