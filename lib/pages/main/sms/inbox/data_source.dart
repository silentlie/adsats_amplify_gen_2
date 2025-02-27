import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/actions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InboxDataSource extends DataTableSource {
  InboxDataSource({required this.sortedData});

  List<Notice> sortedData;

  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final notice = sortedData[index];
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
            notice.noticedAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    notice.noticedAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          getCenterText(
            notice.deadlineAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    notice.deadlineAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: NoticeActions(notice: notice),
          ),
        ),
      ],
    );
  }
}
