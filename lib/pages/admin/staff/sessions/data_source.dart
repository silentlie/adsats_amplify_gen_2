import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionDataSource extends DataTableSource {
  SessionDataSource({required this.sortedData, required this.context});
  List<Session> sortedData;
  BuildContext context;

  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final session = sortedData[index];
    final formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss zzz');
    final startTime = session.createdAt!.getDateTimeInUtc();
    final endTime = session.updatedAt!.getDateTimeInUtc();
    final duration = endTime.difference(startTime);
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          getCenterText(formattedDateTime.format(startTime)),
        ),
        DataCell(
          getCenterText(formattedDateTime.format(endTime)),
        ),
        DataCell(
          getCenterText(
            "${duration.inHours}h ${duration.inMinutes.remainder(60)}m",
          ),
        ),
      ],
    );
  }
}
