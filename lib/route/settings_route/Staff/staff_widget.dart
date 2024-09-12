import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/settings_route/Staff/staff_api.dart';
import 'package:adsats_amplify_gen_2/route/settings_route/settings_filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'staff_data_source.dart';

class StaffDataTable2 extends StatefulWidget {
  const StaffDataTable2({super.key});

  @override
  State<StaffDataTable2> createState() => _StaffDataTable2State();
}

class _StaffDataTable2State extends State<StaffDataTable2> {
  late StaffDataSource dataSource;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = true;
  int _sortColumnIndex = 3;
  Comparable Function(Staff staff) getField = (staff) {
    return staff.createdAt!;
  };

  get columns {
    return <DataColumn2>[
      DataColumn2(
        label: getCenterText("Name"),
        size: ColumnSize.S,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (staff) {
              return staff.name;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Email"),
        size: ColumnSize.S,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (staff) {
              return staff.email;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Aircraft"),
        size: ColumnSize.L,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (staff) {
              return staff.aircraft.hashCode;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Roles"),
        size: ColumnSize.L,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (staff) {
              return staff.roles.hashCode;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Archived"),
        fixedWidth: 100,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (staff) {
              return staff.archived.hashCode;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Upload date"),
        fixedWidth: 100,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (staff) {
              return staff.createdAt!;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Action"),
        fixedWidth: 80,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (staff) {
              return staff.hashCode;
            };
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    dataSource = StaffDataSource(context);
    if (StaffDataSource.isInitialize) {
      return builder(context, dataSource);
    }
    return FutureBuilder(
      future: dataSource.fetchRawData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return builder(context, dataSource);
        }
      },
    );
  }

  Widget builder(BuildContext context, StaffDataSource dataSource) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    dataSource.sort(getField, _sortAscending);
    return PaginatedDataTable2(
      columns: columns,
      source: dataSource,
      headingRowColor: WidgetStateColor.resolveWith((states) {
        return colorScheme.surfaceContainerHighest;
      }),
      columnSpacing: 0,
      empty: const Text("There is nothing"),
      initialFirstRowIndex: 0,
      rowsPerPage: _rowsPerPage,
      availableRowsPerPage: [
        _rowsPerPage,
        _rowsPerPage * 2,
        _rowsPerPage * 5,
        _rowsPerPage * 10,
      ],
      onRowsPerPageChanged: (value) {
        // No need to wrap in setState, behave diff in this package
        _rowsPerPage = value!;
      },
      onPageChanged: (rowIndex) {
        // debugPrint((rowIndex / _rowsPerPage).toString());
      },
      header: dataSource.header,
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
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAscending,
      sortArrowIcon: Icons.keyboard_arrow_up, // custom arrow
      sortArrowAnimationDuration: const Duration(milliseconds: 150),
    );
  }
}
