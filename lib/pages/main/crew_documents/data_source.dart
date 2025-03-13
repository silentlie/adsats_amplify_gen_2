import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/actions.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/s3.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CrewDocumentDataSource extends DataTableSource {
  CrewDocumentDataSource({
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
    final crewDocument = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        getCrewDocumentFileUrl(crewDocument);
      },
      index: index,
      cells: [
        DataCell(
          getCenterText(crewDocument.name),
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
                color:
                    crewDocument.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(crewDocument.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            crewDocument.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    crewDocument.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: CrewDocumentActions(crewDocument: crewDocument),
          ),
        ),
      ],
    );
  }
}
