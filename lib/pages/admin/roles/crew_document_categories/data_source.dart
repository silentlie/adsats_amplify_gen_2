import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/acttions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/crew_document_category_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CrewDocumentCategoryDataSource extends DataTableSource {
  CrewDocumentCategoryDataSource(
      {required this.sortedData, required this.context});
  List<CrewDocumentCategory> sortedData;
  BuildContext context;
  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final crewDocumentCategory = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return CrewDocumentCategoryView(
              roleId: crewDocumentCategory.role!.id,
              category: crewDocumentCategory,
            );
          },
        );
      },
      index: index,
      cells: [
        DataCell(
          getCenterText(crewDocumentCategory.name),
        ),
        DataCell(
          getCenterText(crewDocumentCategory.description ?? ""),
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
                color: crewDocumentCategory.archived
                    ? Colors.grey
                    : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(crewDocumentCategory.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(
            crewDocumentCategory.createdAt != null
                ? DateFormat('dd/MM/yyyy').format(
                    crewDocumentCategory.createdAt!.getDateTimeInUtc(),
                  )
                : "",
          ),
        ),
        DataCell(
          Center(
            child: CrewDocumentCategoryActions(
              category: crewDocumentCategory,
            ),
          ),
        ),
      ],
    );
  }
}
