import 'dart:convert';

import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/multi_select.dart';
import 'package:adsats_amplify_gen_2/helper/mutable_date_time_range.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/helper/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/route/document_route/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/route/document_route/helper/s3.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:data_table_2/data_table_2.dart';

part 'document_data_source.dart';
part 'document_filter.dart';
part 'search_bar_widget.dart';

class DocumentWidget extends StatelessWidget {
  const DocumentWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: const DocumentDataTable2(),
      ),
    );
  }
}

class DocumentDataTable2 extends StatefulWidget {
  const DocumentDataTable2({super.key});
  @override
  State<DocumentDataTable2> createState() => _DocumentDataTable2State();
}

class _DocumentDataTable2State extends State<DocumentDataTable2> {
  late DocumentsDataSource dataSource;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = false;
  int _sortColumnIndex = 5;

  get columns {
    return <DataColumn2>[
      DataColumn2(
        label: getCenterText("File name"),
        size: ColumnSize.L,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            dataSource.sort((document) {
              return document.name;
            }, ascending);
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Aircraft"),
        size: ColumnSize.S,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            dataSource.sort((document) {
              return document.aircraft.hashCode;
            }, ascending);
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Subcategory"),
        size: ColumnSize.L,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            dataSource.sort((document) {
              return document.subcategory.hashCode;
            }, ascending);
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Category"),
        size: ColumnSize.S,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            dataSource.sort((document) {
              return document.subcategory!.category.hashCode;
            }, ascending);
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
            dataSource.sort((document) {
              return document.archived.hashCode;
            }, ascending);
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
            dataSource.sort((document) {
              return document.createdAt!;
            }, ascending);
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
            dataSource.sort((document) {
              return document.hashCode;
            }, ascending);
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    dataSource = DocumentsDataSource(context);

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
