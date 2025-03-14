import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/actions.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        ViewReportRoute(id: report.id).go(context);
      },
      index: index,
      cells: [
        DataCell(
          getCenterText(report.subject),
        ),
        DataCell(
          getCenterText(report.type!.name.replaceAll('_', ' ')),
        ),
        DataCell(
          getCenterText(report.status?.name ?? ""),
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
          getCenterText(
            report.reportedAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    report.reportedAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
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
