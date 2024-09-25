part of 'documents_widget.dart';

class DocumentsDataSource extends DataTableSource {
  final List<Document> data = [];

  final DocumentsFilter filter;

  final BuildContext context;

  final VoidCallback rebuild;

  DocumentsDataSource({
    required this.context,
    required this.filter,
    required this.rebuild,
  }) {
    final _ = Provider.of<AuthNotifier>(context).user;
    final subcategories = _.subcategories?.map((e) => e.subcategory!) ?? [];
    filter.archived = false;
    filter.subcategories = subcategories;
  }

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final document = data[index];
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(document.name),
        ),
        DataCell(
          getCenterText(document.staff?.name ?? ""),
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
      context,
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
              rebuild();
            },
            icon: const Icon(Icons.archive_outlined),
          ),
        if (authNotifier.isAdmin)
          IconButton(
            onPressed: () async {
              await delete(document);
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
        document: listDocuments,
        variables: {"filter": filter.toJson()},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      data.clear();
      for (var document in jsonMap["listDocuments"]["items"]) {
        data.add(Document.fromJson(document));
      }
      // notifyListeners();
      // debugPrint("did call fetchRawData");
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchRawData Document failed: $e');
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchRawData Document failed: $e');
    }
  }

  void sort<T>(
      Comparable<T> Function(Document document) getField, bool ascending) {
    data.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
}
