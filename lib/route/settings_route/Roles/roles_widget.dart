import 'dart:convert';

import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/settings_route/settings_filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'roles_data_source.dart';

class RolesDataTable2 extends StatefulWidget {
  const RolesDataTable2({super.key});

  @override
  State<RolesDataTable2> createState() => _RolesDataTable2State();
}

class _RolesDataTable2State extends State<RolesDataTable2> {
  late RolesDataSource dataSource;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = true;
  int _sortColumnIndex = 3;
  Comparable Function(Role role) getField = (role) {
    return role.createdAt!;
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
            getField = (role) {
              return role.name;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Description"),
        size: ColumnSize.L,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (role) {
              return role.description ?? "";
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
            getField = (role) {
              return role.archived.hashCode;
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
            getField = (role) {
              return role.createdAt!;
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
            getField = (role) {
              return role.hashCode;
            };
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    dataSource = RolesDataSource(context);
    if (RolesDataSource.isInitialize) {
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

  Widget builder(BuildContext context, RolesDataSource dataSource) {
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
