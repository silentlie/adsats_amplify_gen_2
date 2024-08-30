import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';

part 'data_table_source.dart';

class MyDataTable2 extends StatefulWidget {
  const MyDataTable2(this._dataSource, {super.key});
  final MyDataTableSource _dataSource;
  @override
  State<MyDataTable2> createState() => _MyDataTable2State();
}

class _MyDataTable2State extends State<MyDataTable2> {
  MyDataTableSource get dataSource => widget._dataSource;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return PaginatedDataTable2(
      columns: dataSource.columns,
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
      // TODO: add sort function
      // sortColumnIndex: 0,
      // sortAscending: true,

    );
  }
}
