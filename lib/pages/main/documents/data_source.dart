import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/actions.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/s3.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DocumentDataSource extends DataTableSource {
  DocumentDataSource({
    required this.sortedData,
  });
  List<Document> sortedData;
  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final document = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        getFileUrl(document);
      },
      index: index,
      cells: [
        DataCell(
          getCenterText(document.name),
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
                color: document.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(document.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            document.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    document.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: DocumentActions(document: document),
          ),
        ),
      ],
    );
  }
}
