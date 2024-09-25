import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/helper/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_api.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notices_filter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

part 'outbox_data_source.dart';

class OutboxDataTable2 extends StatefulWidget {
  const OutboxDataTable2({super.key});

  @override
  State<OutboxDataTable2> createState() => _OutboxDataTable2State();
}

class _OutboxDataTable2State extends State<OutboxDataTable2> {
  late final OutboxDataSource dataSource = OutboxDataSource(
    context: context,
    filter: filter,
    rebuild: rebuild,
  );
  final NoticesFilter filter = NoticesFilter();
  bool isInitialize = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = false;
  int _sortColumnIndex = 3;
  Comparable Function(Notice notice) getField = (notice) {
    return notice.noticed_at ?? notice.createdAt!;
  };

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Outbox",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 5),
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: [
            IconButton(
              onPressed: rebuild,
              icon: const Icon(Icons.refresh),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.go('/notice');
              },
              label: const Text('Create a new notice'),
              icon: const Icon(
                Icons.add,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            filter.getFilterWidget(context, rebuild),
            const SizedBox(
              width: 10,
            ),
            SearchBarWidget(
              onSubmitted: (value) {
                filter.search = value;
                rebuild();
              },
              initialValue: filter.search,
            ),
          ],
        ),
      ),
    );
  }

  get columns {
    return <DataColumn2>[
      DataColumn2(
        label: getCenterText("Subject"),
        size: ColumnSize.S,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (notice) {
              return notice.subject;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Type"),
        size: ColumnSize.L,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (notice) {
              return notice.type?.name ?? "";
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Status"),
        size: ColumnSize.L,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (notice) {
              return notice.status?.name ?? "";
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
            getField = (notice) {
              return notice.aircraft.hashCode;
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
            getField = (notice) {
              return notice.archived.hashCode;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Notice date"),
        fixedWidth: 100,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (notice) {
              return notice.noticed_at ?? notice.createdAt!;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Deadline"),
        fixedWidth: 80,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (notice) {
              return notice.deadline_at ?? notice.createdAt!;
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
            getField = (notice) {
              return notice.hashCode;
            };
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (isInitialize) {
      return builder(context, dataSource);
    }
    isInitialize = true;
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

  void rebuild() {
    setState(() => isInitialize = false);
  }

  Widget builder(BuildContext context, OutboxDataSource dataSource) {
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
      header: header,
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
