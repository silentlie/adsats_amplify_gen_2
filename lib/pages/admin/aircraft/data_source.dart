import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/helper/date_to_string.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/aircraft_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class AircraftDataSource extends DataTableSource {
  AircraftDataSource({required this.sortedData, required this.context});
  List<Aircraft> sortedData;
  BuildContext context;
  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final aircraft = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AircraftView(
              aircraft: aircraft,
            );
          },
        );
      },
      index: index,
      cells: [
        DataCell(
          getCenterText(aircraft.name),
        ),
        DataCell(
          getCenterText(aircraft.description ?? ""),
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
                color: aircraft.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(aircraft.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            toDateString(aircraft.createdAt?.getDateTimeInUtc())
          ),
        ),
        DataCell(
          Center(
            child: AircraftActions(
              aircraft: aircraft,
            ),
          ),
        ),
      ],
    );
  }
}
