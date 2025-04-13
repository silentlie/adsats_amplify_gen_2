import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/sessions/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/sessions/repo.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/sessions/sort.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SessionsView extends ConsumerWidget {
  const SessionsView({
    super.key,
    required this.staff,
  });

  final Staff staff;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(sessionsRepoProvider(staff));
    final sortState = ref.watch(sessionSortProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1536.0),
      child: AsyncValueWidget(
        value: dataAsync,
        data: (data) {
          data.sort(compareSession(
            sortAscending: sortState.sortAscending,
            getField: sortState.getField,
          ));
          final dataSource = SessionDataSource(
            sortedData: data,
            context: context,
          );
          final sortNotifier = ref.read(sessionSortProvider.notifier);
          return PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: getCenterText("Start time"),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (session) {
                      return session.createdAt!.getDateTimeInUtc();
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Duration"),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (session) {
                      return session.createdAt!
                          .getDateTimeInUtc()
                          .difference(session.updatedAt!.getDateTimeInUtc());
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("End time"),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (session) {
                      return session.updatedAt!.getDateTimeInUtc();
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
            header: ListTile(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  context.canPop() ? context.pop() : HomeRoute().go(context);
                },
              ),
              title: Text("${staff.firstName} ${staff.lastName}"),
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
