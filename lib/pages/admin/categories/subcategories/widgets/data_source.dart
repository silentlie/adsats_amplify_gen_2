import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/models/Subcategory.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/widgets/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/widgets/subcategory.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class SubcategoryDataSource extends DataTableSource {
  SubcategoryDataSource({required this.sortedData, required this.context});
  List<Subcategory> sortedData;
  BuildContext context;
  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final subcategory = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return SubcategoryView(
              subcategory: subcategory,
              categoryId: subcategory.category!.id,
            );
          },
        );
      },
      index: index,
      cells: [
        DataCell(
          subcategory.name.centeredTextWidget(),
        ),
        DataCell(
          (subcategory.description ?? "").centeredTextWidget(),
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
                    subcategory.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(subcategory.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          (subcategory.createdAt?.toCompactDateString ?? "")
              .centeredTextWidget(),
        ),
        DataCell(
          Center(
            child: SubcategoryActions(
              subcategory: subcategory,
            ),
          ),
        ),
      ],
    );
  }
}
