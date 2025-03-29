import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/header.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/sort.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlightCrewRecordsView extends ConsumerWidget {
  const FlightCrewRecordsView({
    super.key,
    required this.staff,
    required this.category,
  });
  final Staff staff;
  final CrewDocumentCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(flightCrewRecordFilterProvider(staff, category));
    final dataAsync = ref.watch(flightCrewRecordsRepoProvider(filter));
    final sortState = ref.watch(flightCrewRecordSortProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1536.0),
      child: AsyncValueWidget(
        value: dataAsync,
        data: (data) {
          data.sort(compareFlightCrewRecord(
            sortAscending: sortState.sortAscending,
            getField: sortState.getField,
          ));
          final dataSource = FlightCrewRecordsDataSource(
            sortedData: data,
          );
          final sortNotifier = ref.read(flightCrewRecordSortProvider.notifier);
          return PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: getCenterText("Name"),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (crewDocument) {
                      return crewDocument.name;
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
                    getField: (crewDocument) {
                      return crewDocument.archived.hashCode;
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
                    getField: (crewDocument) {
                      return crewDocument.createdAt!;
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
                    getField: (crewDocument) {
                      return crewDocument.hashCode;
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
            header: FlightCrewRecordsHeader(
              category: category,
              staff: staff,
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
