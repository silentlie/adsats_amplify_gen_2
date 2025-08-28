import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/helper/providers/sort.dart';
import 'package:adsats_amplify_gen_2/models/Notice.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notices/header.dart';
import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeDataTable extends ConsumerWidget {
  const NoticeDataTable({
    super.key,
    required this.dataSource,
  });

  final NoticeDataSource dataSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final sortState = ref.watch(sortProvider<Notice>());
    final sortNotifier = ref.read(sortProvider<Notice>().notifier);
    return Container(
      constraints: const BoxConstraints(maxWidth: 1536.0),
      child: PaginatedDataTable2(
        columns: <DataColumn2>[
          DataColumn2(
            label: "Subject".centeredTextWidget(),
            size: ColumnSize.S,
            onSort: (columnIndex, ascending) {
              sortNotifier.apply(
                columnIndex: columnIndex,
                sortAscending: ascending,
                getField: (notice) {
                  return notice.subject.toLowerCase();
                },
              );
            },
          ),
          DataColumn2(
            label: "Type".centeredTextWidget(),
            size: ColumnSize.L,
            onSort: (columnIndex, ascending) {
              sortNotifier.apply(
                columnIndex: columnIndex,
                sortAscending: ascending,
                getField: (notice) {
                  return notice.type?.name;
                },
              );
            },
          ),
          DataColumn2(
            label: "Status".centeredTextWidget(),
            size: ColumnSize.L,
            onSort: (columnIndex, ascending) {
              sortNotifier.apply(
                columnIndex: columnIndex,
                sortAscending: ascending,
                getField: (notice) {
                  return notice.status?.name;
                },
              );
            },
          ),
          DataColumn2(
            label: "Aircraft".centeredTextWidget(),
            size: ColumnSize.L,
            onSort: (columnIndex, ascending) {
              sortNotifier.apply(
                columnIndex: columnIndex,
                sortAscending: ascending,
                getField: (notice) {
                  final names =
                      notice.aircraft?.map((e) => e.aircraft?.name ?? '') ?? [];
                  if (names.isEmpty) return null;
                  final count = names.length.toString().padLeft(6, '0');
                  return '$count\u0001${names.sorted().join('\u0001')}';
                },
              );
            },
          ),
          DataColumn2(
            label: "Archived".centeredTextWidget(),
            fixedWidth: 100,
            onSort: (columnIndex, ascending) {
              sortNotifier.apply(
                columnIndex: columnIndex,
                sortAscending: ascending,
                getField: (notice) {
                  return notice.archived.hashCode;
                },
              );
            },
          ),
          DataColumn2(
            label: "Notice date".centeredTextWidget(),
            fixedWidth: 100,
            onSort: (columnIndex, ascending) {
              sortNotifier.apply(
                columnIndex: columnIndex,
                sortAscending: ascending,
                getField: (notice) {
                  return notice.noticedAt;
                },
              );
            },
          ),
          DataColumn2(
            label: "Deadline".centeredTextWidget(),
            fixedWidth: 80,
            onSort: (columnIndex, ascending) {
              sortNotifier.apply(
                columnIndex: columnIndex,
                sortAscending: ascending,
                getField: (notice) {
                  return notice.deadlineAt;
                },
              );
            },
          ),
          DataColumn2(
            label: "Actions".centeredTextWidget(),
            fixedWidth: 80,
            onSort: (columnIndex, ascending) {
              sortNotifier.apply(
                columnIndex: columnIndex,
                sortAscending: ascending,
                getField: (notice) {
                  return notice.hashCode;
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
        header: NoticeHeader(),
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
      ),
    );
  }
}
