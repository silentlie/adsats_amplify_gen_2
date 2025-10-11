import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/widgets/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/widgets/aircraft.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([listStaff])
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
          Text(aircraft.name),
        ),
        DataCell(
          (aircraft.description ?? "").centeredTextWidget(),
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
          (aircraft.createdAt?.toCompactDateString ?? "").centeredTextWidget(),
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
