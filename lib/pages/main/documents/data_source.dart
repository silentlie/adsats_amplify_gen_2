import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/actions.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/edit_document_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DocumentDataSource extends DataTableSource {
  DocumentDataSource({
    required this.sortedData,
    required this.context,
  });
  List<Document> sortedData;
  BuildContext context;
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
        showDialog(
          context: context,
          builder: (context) {
            return EditDocumentView(document: document);
          },
        );
      },
      index: index,
      cells: [
        DataCell(
          document.name.centeredTextWidget(),
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
          (document.issuedAt?.toCompactDateString ?? "").centeredTextWidget(),
        ),
        DataCell(
          (document.expiredAt?.toCompactDateString ?? "").centeredTextWidget(),
        ),
        DataCell(
          (document.createdAt?.toCompactDateString ?? "").centeredTextWidget(),
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
