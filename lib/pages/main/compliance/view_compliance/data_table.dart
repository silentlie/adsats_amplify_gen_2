import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/header.dart';
import 'package:adsats_amplify_gen_2/pages/main/compliance/view_compliance/sort.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportDataTable extends ConsumerWidget {
  const ReportDataTable({
    super.key,
    required this.value,
  });

  final AsyncValue<List<Report>> value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortState = ref.watch(reportSortProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1536.0),
      child: AsyncValueWidget(
        value: value,
        data: (data) {
          data.sort(compareReports(
            sortAscending: sortState.sortAscending,
            getField: sortState.getField,
          ));
          final dataSource = ReportDataSource(
            sortedData: data,
            context: context,
          );
          final sortNotifier = ref.read(reportSortProvider.notifier);
          return PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: getCenterText("Subject"),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (report) {
                      return report.subject;
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Type"),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (report) {
                      return report.type?.name ?? "";
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Status"),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (report) {
                      return report.status?.name ?? "";
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Archived"),
                fixedWidth: 100,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (report) {
                      return report.archived.hashCode;
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Report date"),
                fixedWidth: 100,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (report) {
                      return report.reportedAt ?? report.createdAt!;
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Actions"),
                fixedWidth: 80,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (report) {
                      return report.hashCode;
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
            rowsPerPage: sortState.rowsPerPage,
            availableRowsPerPage: [
              sortState.rowsPerPage,
              sortState.rowsPerPage * 2,
              sortState.rowsPerPage * 5,
              sortState.rowsPerPage * 10,
            ],
            onRowsPerPageChanged: (value) {
              // No need to wrap in setState, behave diff in this package
              sortNotifier.rowsPerPage(value!);
            },
            onPageChanged: (rowIndex) {
              // debugPrint((rowIndex / _rowsPerPage).toString());
            },
            header: ReportHeader(),
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
