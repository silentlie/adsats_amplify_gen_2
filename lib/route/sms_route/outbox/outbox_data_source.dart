part of 'outbox_widget.dart';

class OutboxDataSource extends DataTableSource {
  final List<Notice> data = [];

  final NoticesFilter filter;

  final BuildContext context;

  final VoidCallback rebuild;

  OutboxDataSource({
    required this.context,
    required this.filter,
    required this.rebuild,
  }) {
    filter.archived = false;
    filter.staff = Provider.of<AuthNotifier>(context).user;
  }
  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final notice = data[index];
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
                  ?.map((e) => e.aircraft!.name)
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
            notice.noticed_at != null
                ? DateFormat('dd/MM/yyyy').format(
                    notice.noticed_at!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          getCenterText(
            notice.deadline_at != null
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
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            context.go('/sms', extra: notice);
          },
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          onPressed: () async {
            await update(notice.copyWith(archived: !notice.archived));
            rebuild();
          },
          icon: const Icon(Icons.archive_outlined),
        ),
        IconButton(
          onPressed: () async {
            await delete(notice);
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
      final filterJson = filter.toJson();
      filterJson["staffId"] = {"eq": filter.staff.id};
      final request = GraphQLRequest<String>(
        document: listNotices,
        variables: {"filter": filterJson},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      data.clear();
      for (var notices in jsonMap["listNotices"]["items"]) {
        data.add(Notice.fromJson(notices));
      }
      // debugPrint("did call fetchRawData");
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchRawData Outbox failed: $e');
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchRawData Outbox failed: $e');
    }
  }

  void sort<T>(Comparable<T> Function(Notice notice) getField, bool ascending) {
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
