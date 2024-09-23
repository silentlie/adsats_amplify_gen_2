part of 'inbox_widget.dart';

class InboxDataSource extends DataTableSource {
  final List<Notice> _data = [];

  late final NoticesFilter _filter;

  final BuildContext _context;

  InboxDataSource(this._context) {
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
    final request = GraphQLRequest<String>(
      document: listInbox,
      variables: {
        "filter": {
          "staffId": {"eq": _filter.staff.id}
        }
      },
    );
    try {
      final noticeIds = await list(NoticeStaff.classType,
          where: NoticeStaff.STAFF.eq(_filter.staff.id));
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final listNoticeStaffs = jsonMap["listNoticeStaffs"];
      final List<Map<String, dynamic>> noticeStaffs;
      listNoticeStaffs == null
          ? noticeStaffs = []
          : noticeStaffs = List<Map<String, dynamic>>.from(
              listNoticeStaffs["items"],
            );
      _data.clear();
      for (var noticeStaff in noticeStaffs) {
        _data.add(NoticeStaff.fromJson(noticeStaff).notice!);
      }
      notifyListeners();
      // debugPrint("did call fetchRawData");
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchRawData Inbox failed: $e');
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchRawData Inbox failed: $e');
    }
  }

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Inbox",
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
