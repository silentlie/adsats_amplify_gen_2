part of 'outbox_widget.dart';

class OutboxDataSource extends DataTableSource {
  static bool isInitialize = false;

  static final List<Notice> _data = [];

  late final NoticesFilter _filter;

  final BuildContext _context;

  OutboxDataSource(this._context) {
    _filter = NoticesFilter(
      staff: Provider.of<AuthNotifier>(_context).user,
      archived: false,
    );
  }

  @override
  int get rowCount => _data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final notice = _data[index];
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(notice.subject),
        ),
        DataCell(
          getCenterText(notice.type!.name.replaceAll('_', ' ')),
        ),
        DataCell(
          getCenterText(notice.status?.name ?? ""),
        ),
        DataCell(
          getCenterText(notice.aircraft
                  ?.map(
                    (e) {
                      return e.aircraft!.name;
                    },
                  )
                  .toList()
                  .join(', ') ??
              ""),
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
                color: notice.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(notice.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            notice.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    notice.noticed_at!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          getCenterText(
            notice.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    notice.deadline_at!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: getActions(notice),
          ),
        ),
      ],
    );
  }

  Widget getActions(Notice notice) {
    //TODO: add function
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
      query ListNotices(\$filter: ModelNoticeFilterInput) {
        listNotices(filter: \$filter) {
          items {
            id
            subject
            type
            status
            details
            archived
            noticed_at
            deadline_at
            createdAt
            staffId
            author {
              id
              email
              updatedAt
              name
              createdAt
              archived
            }
            documents {
              items {
                updatedAt
                noticeId
                name
                id
                createdAt
              }
            }
            aircraft {
              items {
                aircraftId
                createdAt
                id
                noticeId
                updatedAt
                aircraft {
                  updatedAt
                  name
                  id
                  description
                  createdAt
                  archived
                }
              }
            }
            recipients {
              items {
                staffId
                updatedAt
                read_at
                noticeId
                id
                staff {
                  archived
                  createdAt
                  id
                  name
                  email
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
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listNotices = jsonMap["listNotices"];
      final List<Map<String, dynamic>> notices;
      listNotices == null
          ? notices = []
          : notices = List<Map<String, dynamic>>.from(
              jsonMap["listNotices"]["items"],
            );
      _data.clear();
      for (var notices in notices) {
        _data.add(Notice.fromJson(notices));
      }
      isInitialize = true;
      notifyListeners();
      debugPrint("did call fetchRawData");
    } on Exception catch (e) {
      debugPrint(
        'Error Exception while retrieving notices: $e',
      );
      rethrow;
    }
  }

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Outbox",
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
            // TODO add new
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

  void sort<T>(Comparable<T> Function(Notice notice) getField, bool ascending) {
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
