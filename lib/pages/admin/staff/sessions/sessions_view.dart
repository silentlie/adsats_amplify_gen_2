import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/string_widget_extension.dart';
import 'package:adsats_amplify_gen_2/helper/mixin/compare_mixin.dart';
import 'package:adsats_amplify_gen_2/helper/providers/sort.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/sessions/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/sessions/repo.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SessionsView extends ConsumerWidget with CompareMixin {
  const SessionsView({
    super.key,
    required this.staff,
  });

  final Staff staff;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(sessionsRepoProvider(staff));
    final sortState = ref.watch(sortProvider<Session>());
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1536.0),
      child: AsyncValueWidget(
        value: dataAsync,
        data: (data) {
          data.sort(compare<Session>(
            sortAscending: sortState.sortAscending,
            getField: sortState.getField,
            custom: sortState.custom,
          ));
          final dataSource = SessionDataSource(
            sortedData: data,
            context: context,
          );
          final sortNotifier = ref.read(sortProvider<Session>().notifier);
          return PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: 'Start Time'.centeredTextWidget(),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (session) {
                      return session.createdAt;
                    },
                  );
                },
              ),
              DataColumn2(
                label: 'Duration'.centeredTextWidget(),
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
                label: 'End Time'.centeredTextWidget(),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (session) {
                      return session.updatedAt;
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
            header: ListTile(
              trailing: IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  context.canPop() ? context.pop() : HomeRoute().go(context);
                },
              ),
              leading: Text(
                staff.fullName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
