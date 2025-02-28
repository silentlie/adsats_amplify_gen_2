part of 'route.dart';

class CrewDocumentCategoriesPage extends ConsumerWidget {
  const CrewDocumentCategoriesPage({super.key, required this.roleId});

  final String roleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(crewDocumentCategoryFilterProvider(roleId));
    final dataAsync = ref.watch(crewDocumentCategoriesRepoProvider(filter));
    final sortState = ref.watch(crewDocumentCategorySortProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1536.0),
      child: AsyncValueWidget(
        value: dataAsync,
        data: (value) {
          final data = value.categories!;
          data.sort(compareCrewDocumentCategory(
            sortAscending: sortState.sortAscending,
            getField: sortState.getField,
          ));
          final dataSource = CrewDocumentCategoryDataSource(
            sortedData: data,
            context: context,
          );
          final sortNotifier =
              ref.read(crewDocumentCategorySortProvider.notifier);
          return PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: getCenterText("Name"),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (crewDocumentCategory) {
                      return crewDocumentCategory.name;
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Description"),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (crewDocumentCategory) {
                      return crewDocumentCategory.description ?? "";
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Archived"),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (crewDocumentCategory) {
                      return crewDocumentCategory.archived.hashCode;
                    },
                  );
                },
              ),
              DataColumn2(
                label: getCenterText("Created at"),
                size: ColumnSize.L,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (crewDocumentCategory) {
                      return crewDocumentCategory.createdAt!;
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
                    getField: (crewDocumentCategory) {
                      return crewDocumentCategory.hashCode;
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
            header: CrewDocumentCategoryHeader(
              role: value,
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
