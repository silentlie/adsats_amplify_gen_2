import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/actions.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/s3.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlightCrewRecordsDataSource extends DataTableSource {
  FlightCrewRecordsDataSource({
    required this.sortedData,
  });
  List<CrewDocument> sortedData;
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
        getFlightCrewRecordFileUrl(flightCrewRecord);
      },
      index: index,
      cells: [
        DataCell(
          getCenterText(flightCrewRecord.name),
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
          getCenterText(
            flightCrewRecord.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    flightCrewRecord.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
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
