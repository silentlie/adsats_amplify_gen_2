import 'package:adsats_amplify_gen_2/helper/extensions/file_compare_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/compare_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/sort.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/documents.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/header.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocumentsView extends ConsumerWidget with CompareMixin {
  const DocumentsView({
    super.key,
    required this.subcategory,
  });
  final Subcategory subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(
      documentsProvider(subcategory),
    );
    final sortState = ref.watch(sortProvider<Document>());
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1536.0),
      child: AsyncValueWidget(
        value: dataAsync,
        data: (data) {
          data.sort(compare<Document>(
            sortAscending: sortState.sortAscending,
            getField: sortState.getField,
          ));
          final dataSource = DocumentsDataSource(
            sortedData: data,
            context: context,
          );
          final sortNotifier = ref.read(sortProvider<Document>().notifier);
          return PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: "Name".centeredTextWidget(),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (document) {
                      return document.name;
                    },
                    custom: (a, b, sortAscending) {
                      return a.name.naturalCompareTo(b.name) *
                          (sortAscending ? 1 : -1);
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
                    getField: (document) {
                      return document.archived.hashCode;
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Issue Date".centeredTextWidget(),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (document) {
                      return document.issuedAt!;
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Expire Date".centeredTextWidget(),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (document) {
                      return document.updatedAt!;
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
                    getField: (document) {
                      return document.createdAt!;
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
                    getField: (document) {
                      return document.hashCode;
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
            header: DocumentsHeader(
              subcategory: subcategory,
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
