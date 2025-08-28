import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/enum_label_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/actions.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
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
          Text(notice.subject),
        ),
        DataCell(
          notice.type!.label.centeredTextWidget(),
        ),
        DataCell(
          (notice.status?.name ?? "").centeredTextWidget(),
        ),
        DataCell(
          (notice.aircraft
                      ?.map(
                        (e) {
                          return e.aircraft!.name;
                        },
                      )
                      .toList()
                      .join(', ') ??
                  "")
              .centeredTextWidget(),
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
          (notice.noticedAt?.toCompactDateString ?? "").centeredTextWidget(),
        ),
        DataCell(
          (notice.deadlineAt?.toCompactDateString ?? "").centeredTextWidget(),
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
