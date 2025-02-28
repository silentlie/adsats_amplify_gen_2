part of 'route.dart';

class StaffPage extends ConsumerWidget {
  const StaffPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(adminFilterProvider);
    final dataAsync = ref.watch(staffRepoProvider(filter));
    final sortState = ref.watch(staffSortProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: AsyncValueWidget(
          value: dataAsync,
          data: (data) {
            data.sort(compareStaff(
              sortAscending: sortState.sortAscending,
              getField: sortState.getField,
            ));
            final dataSource = StaffDataSource(
              sortedData: data,
              context: context,
            );
            final sortNotifier = ref.read(staffSortProvider.notifier);
            return PaginatedDataTable2(
              columns: <DataColumn2>[
                DataColumn2(
                  label: getCenterText("Name"),
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
                  label: getCenterText("Email"),
                  size: ColumnSize.S,
                  onSort: (columnIndex, ascending) {
                    sortNotifier.apply(
                      columnIndex: columnIndex,
                      sortAscending: ascending,
                      getField: (staff) {
                        return staff.email;
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
                      getField: (staff) {
                        return staff.aircraft.hashCode;
                      },
                    );
                  },
                ),
                DataColumn2(
                  label: getCenterText("Roles"),
                  size: ColumnSize.L,
                  onSort: (columnIndex, ascending) {
                    sortNotifier.apply(
                      columnIndex: columnIndex,
                      sortAscending: ascending,
                      getField: (staff) {
                        return staff.roles.hashCode;
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
                      getField: (staff) {
                        return staff.archived.hashCode;
                      },
                    );
                  },
                ),
                DataColumn2(
                  label: getCenterText("Created at"),
                  fixedWidth: 100,
                  onSort: (columnIndex, ascending) {
                    sortNotifier.apply(
                      columnIndex: columnIndex,
                      sortAscending: ascending,
                      getField: (staff) {
                        return staff.createdAt!;
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
                      getField: (staff) {
                        return staff.hashCode;
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
              header: StaffHeader(),
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
      ),
    );
  }
}
