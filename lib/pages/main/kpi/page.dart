import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/compare_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/sort.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/models/staff_kpi.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/widgets/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/widgets/header.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/providers/repo.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KPIPage extends ConsumerWidget with CompareMixin {
  const KPIPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(staffKPIFilterProvider);
    final dataAsync = ref.watch(staffKPIRepoProvider(filter));
    final sortState = ref.watch(sortProvider<StaffKPI>());
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return AsyncValueWidget(
      value: dataAsync,
      data: (data) {
        data.sort(compare<StaffKPI>(
          sortAscending: sortState.sortAscending,
          getField: sortState.getField,
          custom: sortState.custom,
        ));
        final dataSource = KPIDataSource(
          sortedData: data,
        );
        final sortNotifier = ref.read(sortProvider<StaffKPI>().notifier);
        return Container(
          constraints: const BoxConstraints(maxWidth: 1536.0),
          child: PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: "Name".centeredTextWidget(),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (staff) {
                      return staff.name;
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
                    getField: (staff) {
                      return staff.archived.hashCode;
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Notices To Crew".centeredTextWidget(),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (staff) {
                      return staff.noticeToCrews;
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Safety Notices".centeredTextWidget(),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (staff) {
                      return staff.safetyNotices;
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Hazard Reports".centeredTextWidget(),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (staff) {
                      return staff.hazardReports;
                    },
                  );
                },
              ),
              DataColumn2(
                label: "Total KPI".centeredTextWidget(),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (staff) {
                      return staff.totalKpi;
                    },
                  );
                },
              ),
              // DataColumn2(
              //   label: getCenterText("Internal Audit Reports"),
              //   size: ColumnSize.L,
              //   onSort: (columnIndex, ascending) {
              //     sortNotifier.apply(
              //       columnIndex: columnIndex,
              //       sortAscending: ascending,
              //       getField: (staff) {
              //         return staff.internalAuditReports;
              //       },
              //     );
              //   },
              // ),
              // DataColumn2(
              //   label: getCenterText("External Audit Reports"),
              //   size: ColumnSize.L,
              //   onSort: (columnIndex, ascending) {
              //     sortNotifier.apply(
              //       columnIndex: columnIndex,
              //       sortAscending: ascending,
              //       getField: (staff) {
              //         return staff.externalAuditReports;
              //       },
              //     );
              //   },
              // ),
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
            header: StaffKPIHeader(),
            dataRowHeight: 62,
            showCheckboxColumn: false,
            // dynamic change rows per page based on height of screen
            autoRowsToHeight: false,
            minWidth: 1328,
            // stick paginator to the bottom when there's few rows
            fit: FlexFit.loose,
            // render empty rows to match rows per page
            renderEmptyRowsInTheEnd: false,
            // customize border of table
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
          ),
        );
      },
    );
  }
}
