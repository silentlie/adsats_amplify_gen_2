import 'dart:convert';

import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/enum_label_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/widgets/actions.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ReportDataSource extends DataTableSource {
  ReportDataSource({
    required this.sortedData,
    required this.context,
  });
  BuildContext context;
  List<Report> sortedData;

  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final report = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        ViewReportRoute(id: report.id).push(context);
      },
      index: index,
      cells: [
        DataCell(
          report.subject.centeredTextWidget(),
        ),
        DataCell(
          report.type!.label.centeredTextWidget(),
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
                color: switch (report.status) {
                  ReportStatus.Pending => Colors.amber,
                  ReportStatus.Closed
                      when jsonDecode(
                              report.details)["is_discrepancies_found"] ==
                          true =>
                    Colors.lime,
                  ReportStatus.Closed => Colors.green,
                  _ => null,
                },
              ),
              child: Center(
                child: Text(report.status!.name),
              ),
            ),
          ),
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
                color: report.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(report.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          (report.reportedAt?.toCompactDateString ?? "").centeredTextWidget(),
        ),
        DataCell(
          Center(
            child: ReportActions(report: report),
          ),
        ),
      ],
    );
  }
}
