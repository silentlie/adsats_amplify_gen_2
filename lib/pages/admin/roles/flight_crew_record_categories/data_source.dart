import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/flight_crew_record_categories/crew_document_category_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class FlightCrewRecordsCategoryDataSource extends DataTableSource {
  FlightCrewRecordsCategoryDataSource(
      {required this.sortedData, required this.context});
  List<FlightCrewRecordCategory> sortedData;
  BuildContext context;
  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final flightCrewRecordsCategory = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return FlightCrewRecordsCategoryView(
              roleId: flightCrewRecordsCategory.role!.id,
              category: flightCrewRecordsCategory,
            );
          },
        );
      },
      index: index,
      cells: [
        DataCell(
          flightCrewRecordsCategory.name.centeredTextWidget(),
        ),
        DataCell(
          (flightCrewRecordsCategory.description ?? "").centeredTextWidget(),
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
                color: flightCrewRecordsCategory.archived
                    ? Colors.grey
                    : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(flightCrewRecordsCategory.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          (flightCrewRecordsCategory.createdAt?.toCompactDateString ?? "")
              .centeredTextWidget(),
        ),
        DataCell(
          Center(
            child: FlightCrewRecordsCategoryActions(
              category: flightCrewRecordsCategory,
            ),
          ),
        ),
      ],
    );
  }
}
