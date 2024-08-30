part of 'documents_widget.dart';

class DocumentsDataSource extends MyDataTableSource {
  static bool _isInitialize = false;

  static final List<Document> _data = [];

  static final DocumentsFilter _filter = DocumentsFilter();

  final BuildContext _context;

  DocumentsDataSource(this._context) {
    if (!_isInitialize) {
      fetchRawData();
    }
  }

  @override
  get columns {
    return <DataColumn2>[
      DataColumn2(
        label: getCenterText("File name"),
        size: ColumnSize.L,
      ),
      DataColumn2(
        label: getCenterText("Aircraft"),
        size: ColumnSize.S,
      ),
      DataColumn2(
        label: getCenterText("Subcategory"),
        size: ColumnSize.L,
      ),
      DataColumn2(
        label: getCenterText("Category"),
        size: ColumnSize.S,
      ),
      DataColumn2(
        label: getCenterText("Archived"),
        fixedWidth: 100,
      ),
      DataColumn2(
        label: getCenterText("Upload date"),
        fixedWidth: 100,
      ),
      DataColumn2(
        label: getCenterText("Action"),
        fixedWidth: 80,
      ),
    ];
  }

  @override
  int get rowCount => _data.length;

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
            child: getActions(index),
          ),
        ),
      ],
    );
  }

  Widget getActions(int index) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(
      _context,
      listen: false,
    );
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            // TODO document download
            // Uri genUrl = await getFileUrl();
            // launchUrl(genUrl);
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
          tooltip: 'View',
        ),
        if (authNotifier.isAdmin || authNotifier.isEditor)
          IconButton(
            onPressed: () async {
              // TODO: document archive
              // await archive();
              fetchRawData();
            },
            icon: const Icon(Icons.archive_outlined),
            tooltip: 'Archive',
          ),
        if (authNotifier.isAdmin)
          IconButton(
            onPressed: () async {
              // TODO: document delete
              // await delete();
              fetchRawData();
            },
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Delete',
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
            size: 20,
          ),
        );
      },
    );
  }

  Future<void> fetchRawData() async {
    const graphQLDocument = '''
      query ListDocuments(\$filter: ModelDocumentFilterInput) {
        listDocuments(filter: \$filter) {
          items {
            id
            name
            subcategory {
              id
              name
              category {
                id
                name
              }
            }
            aircraft {
              items {
                id
                aircraft {
                  id
                  name
                }
              }
            }
            createdAt
            archived
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
      final documents = List<Map<String, dynamic>>.from(
        jsonMap["listDocuments"]["items"],
      );
      _data.clear();
      for (var document in documents) {
        _data.add(Document.fromJson(document));
      }
      _isInitialize = true;
      notifyListeners();
      debugPrint("did call fetchRawData");
    } on Exception catch (e) {
      debugPrint(
        'Error Exception while retrieving documents: $e',
      );
      rethrow;
    }
  }

  @override
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

  // Function to generate a dynamic filter based on a list of subcategory IDs
  Map<String, dynamic> createDynamicFilter(List<String> subcategoryIds) {
    if (subcategoryIds.isEmpty) {
      return {}; // Return an empty filter if no subcategory IDs are provided
    }

    // Create the 'or' filter with multiple 'eq' conditions for subcategoryId
    List<Map<String, dynamic>> orConditions = subcategoryIds.map((id) {
      return {
        "subcategoryId": {"eq": id}
      };
    }).toList();

    return {"or": orConditions};
  }
}
