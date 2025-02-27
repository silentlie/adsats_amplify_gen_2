part of 'route.dart';

class SmsInboxPage extends ConsumerWidget {
  const SmsInboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(noticeFilterProvider);
    final dataAsync = ref.watch(noticesInboxRepoProvider(filter));
    final sortState = ref.watch(sortProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: AsyncValueWidget(
        value: dataAsync,
        data: (data) {
          data.sort(compare(
            sortAscending: sortState.sortAscending,
            getField: sortState.getField,
          ));
          final dataSource = InboxDataSource(sortedData: data);
          final sortNotifier = ref.read(sortProvider.notifier);
          return PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: getCenterText("Subject"),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (notice) {
                      return notice.subject;
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
                    getField: (notice) {
                      return notice.type?.name ?? "";
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
                    getField: (notice) {
                      return notice.status?.name ?? "";
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Aircraft"),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (notice) {
                      return notice.aircraft.hashCode;
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
                    getField: (notice) {
                      return notice.archived.hashCode;
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Notice date"),
                fixedWidth: 100,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (notice) {
                      return notice.noticedAt ?? notice.createdAt!;
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Deadline"),
                fixedWidth: 80,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (notice) {
                      return notice.deadlineAt ?? notice.createdAt!;
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Action"),
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
          );
        },
      ),
    );
  }
}
