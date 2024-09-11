part of 'categories_widget.dart';

class CategoriesDataSource extends DataTableSource {
  static bool isInitialize = false;

  static final List<Category> data = [];

  static final SettingsFilter filter = SettingsFilter();

  final BuildContext context;

  CategoriesDataSource(this.context) {
    if (!isInitialize) {
      filter.archived = false;
    }
  }

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final category = data[index];
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(category.name),
        ),
        DataCell(
          getCenterText(category.description ?? ""),
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
                color: category.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(category.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            category.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    category.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: getActions(category),
          ),
        ),
      ],
    );
  }

  Widget getActions(Category category) {
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) {
                return categoryWidget(context, category: category);
              },
            );
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            await update(category.copyWith(archived: !category.archived));
            fetchRawData();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await delete(category);
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
        document: listCategories,
        variables: {"filter": filter.toJson()},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.data == null) {
        throw Exception('No data returned from API');
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listCategoriesResult = jsonMap["listCategories"];
      final List<Map<String, dynamic>> categories;
      listCategoriesResult == null
          ? categories = []
          : categories = List<Map<String, dynamic>>.from(
              jsonMap["listCategories"]["items"],
            );
      data.clear();
      for (var category in categories) {
        data.add(Category.fromJson(category));
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
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return categoryWidget(context);
                  },
                );
              },
              label: const Text('Add a category'),
              icon: const Icon(
                Icons.add,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            filter.getFilterWidget(context, fetchRawData),
            const SizedBox(
              width: 10,
            ),
            SearchBarWidget(filter: filter, fetchRawData: fetchRawData)
          ],
        ),
      ),
    );
  }

  void sort<T>(
      Comparable<T> Function(Category category) getField, bool ascending) {
    data.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  Widget categoryWidget(BuildContext context, {Category? category}) {
    String name = category?.name ?? "";
    String description = category?.description ?? "";
    bool archived = category?.archived ?? false;
    final formKey = GlobalKey<FormState>();
    return AlertDialog.adaptive(
      title: category != null
          ? Text('Editing ${category.name}')
          : const Text('Add a category'),
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
                  labelText: 'Category Name',
                ),
                onChanged: (value) {
                  name = value;
                },
                initialValue: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter category name';
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
                  labelText: 'Description of the category',
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
              Category newCategory = category?.copyWith(
                    name: name,
                    archived: archived,
                    description: description,
                  ) ??
                  Category(
                    name: name,
                    archived: archived,
                    description: description,
                  );
              if (category != null) {
                await Future.wait([
                  update(newCategory),
                ]);
              } else {
                await create(newCategory);
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
