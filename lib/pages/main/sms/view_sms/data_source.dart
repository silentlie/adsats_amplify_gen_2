import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/helper/date_to_string.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/view_sms/actions.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class NoticeDataSource extends DataTableSource {
  NoticeDataSource({
    required this.sortedData,
    required this.context,
  });
  BuildContext context;
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
      onTap: () {
        ViewNoticeRoute(id: notice.id).push(context);
      },
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
          getCenterText(toDateString(notice.noticedAt?.getDateTimeInUtc())),
        ),
        DataCell(
          getCenterText(toDateString(notice.deadlineAt?.getDateTimeInUtc())),
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
