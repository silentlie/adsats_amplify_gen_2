import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/crew_document_category_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          getCenterText(flightCrewRecordsCategory.name),
        ),
        DataCell(
          getCenterText(flightCrewRecordsCategory.description ?? ""),
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
          getCenterText(
            flightCrewRecordsCategory.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    flightCrewRecordsCategory.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
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
