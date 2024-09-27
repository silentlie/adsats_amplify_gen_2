import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/between_date_range.dart';
import 'package:adsats_amplify_gen_2/helper/futrure_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/helper/multi_select.dart';
import 'package:adsats_amplify_gen_2/helper/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/helper/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/helper/center_text.dart';
import 'package:adsats_amplify_gen_2/route/documents_route/file_picker_notifier.dart';
import 'package:adsats_amplify_gen_2/route/documents_route/s3.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:data_table_2/data_table_2.dart';

part 'documents_data_source.dart';
part 'documents_filter.dart';

class DocumentsWidget extends StatelessWidget {
  const DocumentsWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: const DocumentsDataTable2(),
      ),
    );
  }
}

class DocumentsDataTable2 extends StatefulWidget {
  const DocumentsDataTable2({super.key});
  @override
  State<DocumentsDataTable2> createState() => _DocumentsDataTable2State();
}

class _DocumentsDataTable2State extends State<DocumentsDataTable2> {
  late final DocumentsDataSource dataSource = DocumentsDataSource(
    context: context,
    filter: filter,
    rebuild: rebuild,
  );
  final DocumentsFilter filter = DocumentsFilter();
  bool isInitialize = false;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  bool _sortAscending = false;
  int _sortColumnIndex = 5;
  Comparable Function(Document document) getField = (document) {
    return document.createdAt!;
  };

  get header {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Documents",
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
                // context.go('/add-a-document');
                showDialog(
                  context: context,
                  builder: (context) => newDocumentDialog(context),
                );
              },
              label: const Text('Add a document'),
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
        label: getCenterText("File name"),
        size: ColumnSize.L,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (document) {
              return document.name;
            };
          });
        },
      ),
      DataColumn2(
        label: getCenterText("Owner"),
        size: ColumnSize.L,
        onSort: (columnIndex, ascending) {
          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
            getField = (document) {
              return document.staff?.name ?? "";
            };
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
            getField = (document) {
              return document.aircraft.hashCode;
            };
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
            getField = (document) {
              return document.subcategory.hashCode;
            };
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
            getField = (document) {
              return document.subcategory?.category.hashCode ?? double.infinity;
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
            getField = (document) {
              return document.archived.hashCode;
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
            getField = (document) {
              return document.createdAt!;
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
            getField = (document) {
              return document.hashCode;
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

  Widget builder(BuildContext context, DocumentsDataSource dataSource) {
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

  Widget newDocumentDialog(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    Staff staff = authNotifier.user;
    Subcategory? subcategory = staff.subcategories?.firstOrNull?.subcategory;
    List<Aircraft> aircraft = [];
    return ChangeNotifierProvider<FilePickerNotifier>(
      create: (context) => FilePickerNotifier(),
      lazy: false,
      builder: (context, child) {
        return AlertDialog.adaptive(
          title: const Text(
            'Add documents',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                if (authNotifier.isAdmin || authNotifier.isEditor)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutrureDropdownMenu<Staff>(
                      modelType: Staff.classType,
                      toList: (allData) {
                        return allData
                            .map(
                              (e) => DropdownMenuEntry(value: e, label: e.name),
                            )
                            .toList();
                      },
                      onSelected: (value) => staff = value!,
                      text: "Owner",
                      initialSelection: staff,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownMenu(
                    dropdownMenuEntries: staff.subcategories
                            ?.map(
                              (e) => DropdownMenuEntry(
                                  value: e.subcategory,
                                  label: e.subcategory!.name),
                            )
                            .toList() ??
                        [],
                    inputDecorationTheme: const InputDecorationTheme(
                      border: OutlineInputBorder(),
                    ),
                    enableSearch: true,
                    enabled: true,
                    hintText: "Choose a subcategory",
                    menuHeight: 200,
                    label: const Text("Choose a subcategory"),
                    leadingIcon: const Icon(Icons.search),
                    onSelected: (value) {
                      subcategory = value as Subcategory;
                    },
                    initialSelection: subcategory,
                    expandedInsets: EdgeInsets.zero,
                  ),
                ),
                MultiSelect<Aircraft>(
                  items: staff.aircraft?.map(
                        (e) {
                          return MultiSelectItem(e.aircraft!, e.aircraft!.name);
                        },
                      ).toList() ??
                      [],
                  onConfirm: (selectedOptions) {
                    aircraft = List<Aircraft>.from(selectedOptions);
                  },
                  text: "Add aircraft",
                  title: const Text("Add aircraft"),
                ),
                Consumer<FilePickerNotifier>(
                  builder: (context, filePickerProvider, child) {
                    return Column(
                      children: filePickerProvider.selectedFiles.map((file) {
                        return Chip(
                          label: Text(file.name),
                          onDeleted: () {
                            filePickerProvider.removeFile(file);
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              label: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? filePickerResult =
                    await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.any,
                  withData: false,
                  // Ensure to get file stream for better performance
                  withReadStream: true,
                );
                if (!context.mounted) return;
                context
                    .read<FilePickerNotifier>()
                    .addFiles(filePickerResult?.files ?? []);
              },
              child: const Text("Pick file"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                final selectedFiles =
                    context.read<FilePickerNotifier>().selectedFiles;
                if (subcategory == null || selectedFiles.isEmpty) {
                  return;
                }
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Confirm?"),
                      content: const Text("Proceed with file upload?"),
                      actions: [
                        // cancel
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        // apply
                        TextButton(
                          onPressed: () async {
                            await uploadFiles(
                              selectedFiles,
                              staff,
                              subcategory!,
                              aircraft,
                            );
                            if (!context.mounted) return;
                            Navigator.pop(context, 'Apply');
                            Navigator.pop(context, 'Apply');
                            rebuild();
                          },
                          child: const Text('Confirm'),
                        )
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                // Change button background color
                backgroundColor:
                    WidgetStateProperty.all<Color>(colorScheme.secondary),
              ),
              label: Text(
                'Upload Files',
                style: TextStyle(color: colorScheme.onSecondary),
              ),
              icon: Icon(
                Icons.upload_file,
                color: colorScheme.onSecondary,
              ),
            ),
          ],
        );
      },
    );
  }
}
