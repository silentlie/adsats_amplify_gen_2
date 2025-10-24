import 'package:adsats_amplify_gen_2/helper/extensions/compact_date_string_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/widgets/actions.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/widgets/category_view.dart';
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
          category.name.centeredTextWidget(),
        ),
        DataCell(
          (category.description ?? "").centeredTextWidget(),
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
          (category.createdAt?.toCompactDateString ?? "").centeredTextWidget(),
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
