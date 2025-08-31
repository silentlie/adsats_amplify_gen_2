import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/widgets/actions.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/widgets/record.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class FlightCrewRecordsDataSource extends DataTableSource {
  FlightCrewRecordsDataSource({
    required this.sortedData,
    required this.context,
  });
  List<FlightCrewRecord> sortedData;
  BuildContext context;
  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final flightCrewRecord = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return EditFlightCrewRecordView(
              record: flightCrewRecord,
            );
          },
        );
      },
      index: index,
      cells: [
        DataCell(
          flightCrewRecord.name.centeredTextWidget(),
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
                color: flightCrewRecord.archived
                    ? Colors.grey
                    : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(flightCrewRecord.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          (flightCrewRecord.issuedAt?.toCompactDateString ?? "")
              .centeredTextWidget(),
        ),
        DataCell(
          (flightCrewRecord.expiredAt?.toCompactDateString ?? "")
              .centeredTextWidget(),
        ),
        DataCell(
          (flightCrewRecord.createdAt?.toCompactDateString ?? "")
              .centeredTextWidget(),
        ),
        DataCell(
          Center(
            child: FlightCrewRecordActions(flightCrewRecord: flightCrewRecord),
          ),
        ),
      ],
    );
  }
}
