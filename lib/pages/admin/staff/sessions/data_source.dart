import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
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
    final startTime = session.createdAt!.getDateTimeInUtc();
    final endTime = session.updatedAt!.getDateTimeInUtc();
    final duration = endTime.difference(startTime);
    return DataRow2.byIndex(
      index: index,
      cells: [
        DataCell(
          formatDateTimeUTC(startTime).centeredTextWidget(),
        ),
        DataCell(
          ("${duration.inHours}h ${duration.inMinutes.remainder(60)}m")
              .centeredTextWidget(),
        ),
        DataCell(
          formatDateTimeUTC(endTime).centeredTextWidget(),
        ),
      ],
    );
  }

  String formatDateTimeUTC(DateTime dateTime) {
    final utc = dateTime.toUtc();

    final day = DateFormat('dd').format(utc);
    final month = DateFormat('MMM', 'en_US').format(utc).toUpperCase();
    final year = DateFormat('yyyy').format(utc);
    final time = DateFormat('HH:mm:ss').format(utc);

    return '$day$month$year $time UTC';
  }
}
