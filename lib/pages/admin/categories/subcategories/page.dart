import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/compare_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/sort.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/subcategories.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/widgets/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/widgets/header.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubcategoriesPage extends ConsumerWidget with CompareMixin {
  const SubcategoriesPage({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(subcategoriesProvider(categoryId));
    final sortState = ref.watch(sortProvider<Subcategory>());
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1536.0),
      child: AsyncValueWidget(
        value: dataAsync,
        data: (value) {
          final data = value.subcategories!;
          data.sort(compare<Subcategory>(
            sortAscending: sortState.sortAscending,
            getField: sortState.getField,
          ));
          final dataSource = SubcategoryDataSource(
            sortedData: data,
            context: context,
          );
          final sortNotifier = ref.read(sortProvider<Subcategory>().notifier);
          return PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: "Name".centeredTextWidget(),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (subcategory) {
                      return subcategory.name;
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Description".centeredTextWidget(),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (subcategory) {
                      return subcategory.description ?? "";
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Archived".centeredTextWidget(),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (subcategory) {
                      return subcategory.archived.hashCode;
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Create Date".centeredTextWidget(),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (subcategory) {
                      return subcategory.createdAt!;
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Action".centeredTextWidget(),
                fixedWidth: 80,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (subcategory) {
                      return subcategory.hashCode;
                    },
                  );
                },
              ),
            ],
            source: dataSource,
            headingRowColor: WidgetStateColor.resolveWith((states) {
              return colorScheme.surfaceContainerHighest;
            }),
            columnSpacing: 0,
            empty: const Text("There is nothing"),
            initialFirstRowIndex: 0,
            rowsPerPage: sortState.rowsPerPage * 100,
            availableRowsPerPage: [
              sortState.rowsPerPage,
              sortState.rowsPerPage * 2,
              sortState.rowsPerPage * 5,
              sortState.rowsPerPage * 10,
              sortState.rowsPerPage * 20,
              sortState.rowsPerPage * 50,
              sortState.rowsPerPage * 100,
            ],
            onRowsPerPageChanged: (value) {
              // No need to wrap in setState, behave diff in this package
              sortNotifier.rowsPerPage(value!);
            },
            onPageChanged: (rowIndex) {
              // debugPrint((rowIndex / _rowsPerPage).toString());
            },
            header: SubcategoryHeader(
              category: value,
            ),
            dataRowHeight: 62,
            showCheckboxColumn: false,
            // dynamic change rows per page based on height of screen
            autoRowsToHeight: false,
            minWidth: 1328,
            // stick paginator to the bottom when there's few rows
            fit: FlexFit.loose,
            // render empty rows to match rows per page
            renderEmptyRowsInTheEnd: false,
            // customise border of table
            border: const TableBorder(),
            hidePaginator: false,
            wrapInCard: true,
            // how many fixed columns from left
            fixedLeftColumns: 0,
            showFirstLastButtons: true,
            lmRatio: 0.67,
            sortColumnIndex: sortState.sortColumnIndex,
            sortAscending: sortState.sortAscending,
            sortArrowIcon: Icons.keyboard_arrow_up, // custom arrow
            sortArrowAnimationDuration: const Duration(milliseconds: 150),
          );
        },
      ),
    );
  }
}
