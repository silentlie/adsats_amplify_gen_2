part of 'categories_widget.dart';

class CategoriesDataSource extends DataTableSource {
  static bool isInitialize = false;

  static final List<Category> _data = [];

  static final SettingsFilter _filter = SettingsFilter();

  final BuildContext _context;

  CategoriesDataSource(this._context) {
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
    final category = _data[index];
    return DataRow2.byIndex(index: index,cells: [
      DataCell(getCenterText(category.name),),
      DataCell(getCenterText(category.description ?? ""),),
      DataCell(Center(
          child: Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              // maybe make it follow color scheme
              color: category.archived ? Colors.grey : Colors.blue.shade600,
            ),
            child: Center(
              child: Text(category.archived ? "Yes" : "No"),
            ),
          ),
        ),),
      DataCell(getCenterText(
          category.createdAt != null
              ? DateFormat('dd/MM/yyyy').format(
                  category.createdAt!.getDateTimeInUtc(),
                )
              : "",
        ),),
      DataCell(
          Center(
            child: getActions(category),
          ),
        ),
    ],);
  }

  Widget getActions(Category category) {
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
      query ListCategories(\$filter: ModelCategoryFilterInput) {
        listCategories(filter: \$filter) {
          items {
            id
            name
            description
            createdAt
            archived
            updatedAt
            subcategories {
              items {
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
      final listCategories = jsonMap["listCategories"];
      final List<Map<String, dynamic>> categories;
      listCategories == null
          ? categories = []
          : categories = List<Map<String, dynamic>>.from(
              jsonMap["listCategories"]["items"],
            );
      _data.clear();
      for (var category in categories) {
        _data.add(Category.fromJson(category));
      }
      isInitialize = true;
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(
        'Error Exception while retrieving categories: $e',
      );
      rethrow;
    }
  }

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Categories",
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

  void sort<T>(Comparable<T> Function(Category category) getField, bool ascending) {
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
