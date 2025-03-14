import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/actions.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/data_source.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/header.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/sort.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/new_document.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/s3.dart';
import 'package:adsats_amplify_gen_2/widgets/loading_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DocumentsView extends ConsumerWidget {
  const DocumentsView({super.key,
    required this.subcategory,
  });
  final Subcategory subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(documentFilterProvider(subcategory));
    final dataAsync = ref.watch(
      documentsRepoProvider(filter),
    );
    final sortState = ref.watch(documentSortProvider);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1536.0),
      child: AsyncValueWidget(
        value: dataAsync,
        data: (data) {
          data.sort(compareDocument(
            sortAscending: sortState.sortAscending,
            getField: sortState.getField,
          ));
          final dataSource = DocumentDataSource(
            sortedData: data,
          );
          final sortNotifier = ref.read(documentSortProvider.notifier);
          return PaginatedDataTable2(
            columns: <DataColumn2>[
              DataColumn2(
                label: getCenterText("Name"),
                size: ColumnSize.S,
                onSort: (columnIndex, ascending) {
                  sortNotifier.apply(
                    columnIndex: columnIndex,
                    sortAscending: ascending,
                    getField: (document) {
                      return document.name;
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
                    getField: (document) {
                      return document.archived.hashCode;
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
                    getField: (document) {
                      return document.createdAt!;
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
                    getField: (document) {
                      return document.hashCode;
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
            header: DocumentHeader(
              subcategory: subcategory,
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

class OldDocumentsView extends ConsumerWidget {
  const OldDocumentsView({
    super.key,
    required this.subcategory,
  });
  final Subcategory subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(documentFilterProvider(subcategory));
    final documentsAsync = ref.watch(
      documentsRepoProvider(filter),
    );
    var widgets = documentsAsync.when<List<Widget>>(
      data: (documents) {
        return documents.map(
          (document) {
            return ListTile(
              leading: Icon(Icons.description_outlined),
              title: Text(document.name),
              trailing: DocumentActions(
                document: document,
              ),
              subtitle: Text([
                document.archived ? "Archived" : "Active",
                DateFormat('dd/MM/yyyy').format(
                  document.createdAt!.getDateTimeInUtc(),
                ),
                if (document.staff != null) document.staff!.name,
                ...document.aircraft!.map(
                  (e) => e.aircraft!.name,
                ),
              ].join(" - ")),
              titleAlignment: ListTileTitleAlignment.center,
              onTap: () => getFileUrl(document),
            );
          },
        ).toList();
      },
      error: (error, stackTrace) {
        final colorScheme = ColorScheme.of(context);
        return [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              error.toString(),
              style: TextStyle(color: colorScheme.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {
                ref.invalidate(documentsRepoProvider(filter));
              },
              label: Text("Retry"),
              icon: Icon(Icons.refresh),
            ),
          ),
        ];
      },
      loading: () => [LoadingView()],
    );
    if (widgets.isEmpty) {
      widgets = [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("There is no document"),
        ),
      ];
    }
    return Column(
      children: [
        ListTile(
          leading: ElevatedButton.icon(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => NewDocumentDialog(
                  subcategory: subcategory,
                ),
              );
              ref.invalidate(documentsRepoProvider(filter));
            },
            label: const Text('Add a document'),
            icon: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
          title: SearchBarWidget(
            onSubmitted: (value) {
              ref
                  .read(documentFilterProvider(subcategory).notifier)
                  .search(value);
            },
            initialValue: filter.search,
          ),
          trailing: Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  ref.invalidate(documentsRepoProvider(filter));
                },
                label: Text("Refresh"),
                icon: Icon(Icons.refresh_outlined),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DocumentsFilterView(subcategory: subcategory);
                    },
                  );
                },
                label: Text("Filter"),
                icon: Icon(Icons.filter_alt_outlined),
              ),
            ],
          ),
        ),
        ...widgets
      ],
    );
  }
}
