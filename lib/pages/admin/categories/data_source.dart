import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/helper/date_to_string.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/category_view.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class CategoryDataSource extends DataTableSource {
  CategoryDataSource({required this.sortedData, required this.context});
  List<Category> sortedData;
  BuildContext context;
  @override
  int get rowCount => sortedData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow2 getRow(int index) {
    final category = sortedData[index];
    return DataRow2.byIndex(
      onTap: () {
        SubcategoriesRoute(categoryId: category.id).push(context);
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return CategoryView(
              category: category,
            );
          },
        );
      },
      index: index,
      cells: [
        DataCell(
          Text(category.name),
        ),
        DataCell(
          getCenterText(category.description ?? ""),
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
                color: category.archived ? Colors.grey : Colors.blue.shade600,
              ),
              child: Center(
                child: Text(category.archived ? "Yes" : "No"),
              ),
            ),
          ),
        ),
        DataCell(
          getCenterText(toDateString(category.createdAt?.getDateTimeInUtc())),
        ),
        DataCell(
          Center(
            child: CategoryActions(
              category: category,
            ),
          ),
        ),
      ],
    );
  }
}
