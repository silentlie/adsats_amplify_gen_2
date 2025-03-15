import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/repo.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class KPIDataSource extends DataTableSource {
  KPIDataSource({
    required this.sortedData,
  });
  List<StaffKPI> sortedData;

  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final staff = sortedData[index];
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(staff.name),
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
                color: staff.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(staff.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            staff.noticeToCrews.toString(),
          ),
        ),
        DataCell(
          getCenterText(
            staff.safetyNotices.toString(),
          ),
        ),
        DataCell(
          getCenterText(
            staff.hazardReports.toString(),
          ),
        ),
        DataCell(
          getCenterText(
            staff.internalAuditReports.toString(),
          ),
        ),
        DataCell(
          getCenterText(
            staff.externalAuditReports.toString(),
          ),
        ),
      ],
    );
  }
}
