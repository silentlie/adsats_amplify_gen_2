import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/futrure_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/helper/multi_select.dart';
import 'package:adsats_amplify_gen_2/helper/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/helper/file_picker_notifier.dart';
import 'package:adsats_amplify_gen_2/route/documents_route/filter.dart';
import 'package:adsats_amplify_gen_2/route/documents_route/s3.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class DocumentsWidget extends StatefulWidget {
  const DocumentsWidget({super.key});

  static String path = '/documents';

  @override
  State<DocumentsWidget> createState() => _DocumentsWidgetState();
}

class _DocumentsWidgetState extends State<DocumentsWidget> {
  bool isInitialize = false;
  @override
  Widget build(BuildContext context) {
    Map<Category, List<Subcategory>> map = {};
    Provider.of<AuthNotifier>(context).user.subcategories?.forEach(
      (staffSubcategory) {
        if (map[staffSubcategory.subcategory!.category!] == null) {
          map[staffSubcategory.subcategory!.category!] = [];
        }
        map[staffSubcategory.subcategory!.category!]!
            .add(staffSubcategory.subcategory!);
      },
    );
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  // contentPadding: const EdgeInsets.only(),
                  leading: const Text(
                    "Documents",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: ElevatedButton.icon(
                    onPressed: () {
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
                ),
                ...map.entries.map(
                  (entry) {
                    return ExpansionTile(
                      leading: Icon(Icons.view_agenda_outlined),
                      title: Text(entry.key.name),
                      enabled: !entry.key.archived,
                      children: entry.value.map(
                        (subcategory) {
                          return ExpansionTile(
                            leading: Icon(Icons.view_list_outlined),
                            title: Text(subcategory.name),
                            enabled: !subcategory.archived,
                            children: [
                              DocumentsViewWidget(subcategory: subcategory)
                            ],
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
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
                  FutrureDropdownMenu<Staff>(
                    modelType: Staff.classType,
                    toList: (allData) {
                      return allData
                          .map(
                              (e) => DropdownMenuEntry(value: e, label: e.name))
                          .toList();
                    },
                    onSelected: (value) =>
                        context.read<FilePickerNotifier>().staff = value!,
                    text: "Owner",
                    initialSelection: context.read<FilePickerNotifier>().staff,
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
                            setState(() {});
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

class DocumentsViewWidget extends StatefulWidget {
  const DocumentsViewWidget({super.key, required this.subcategory});
  final Subcategory subcategory;

  @override
  State<DocumentsViewWidget> createState() => _DocumentsViewWidgetState();
}

class _DocumentsViewWidgetState extends State<DocumentsViewWidget> {
  late final Filter filter;

  @override
  void initState() {
    filter = Filter(subcategory: widget.subcategory, archived: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchDocuments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children: [
              ListTile(
                leading: ElevatedButton.icon(
                  onPressed: () {
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
                title: SearchBarWidget(
                  onSubmitted: (value) {
                    setState(() {
                      filter.search = value;
                    });
                  },
                  initialValue: filter.search,
                ),
                trailing: filter.getFilterWidget(context, setState),
              ),
              if (snapshot.data!.isEmpty) Text("There is no document"),
              ...snapshot.data!.map(
                (document) {
                  return ListTile(
                    leading: Icon(Icons.description_outlined),
                    title: Text(document.name),
                    trailing: getActions(context, document),
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
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Placeholder();
                      },
                    ),
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }

  Future<List<Document>> fetchDocuments() async {
    try {
      final request = GraphQLRequest<String>(
        document: listDocuments,
        variables: {"filter": filter.toJson()},
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      return (jsonMap["listDocuments"]["items"] as List).map(
        (document) {
          return Document.fromJson(document);
        },
      ).toList();
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchRawData Document failed: $e');
      return [];
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchRawData Document failed: $e');
      return [];
    }
  }

  Widget getActions(BuildContext context, Document document) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(
      context,
      listen: false,
    );
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            await getFileUrl(document);
          },
          icon: const Icon(Icons.download_outlined),
          tooltip: "Download",
        ),
        if (authNotifier.isAdmin || authNotifier.isEditor)
          IconButton(
            onPressed: () async {
              await archive(document);
              setState(() {});
            },
            icon: const Icon(Icons.archive_outlined),
            tooltip: "Archive",
          ),
        if (authNotifier.isAdmin)
          IconButton(
            onPressed: () async {
              await delete(document);
              setState(() {});
            },
            icon: const Icon(Icons.delete_outline),
            tooltip: "Delete",
          ),
      ],
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(
            Icons.more_vert,
            // size: 20,
          ),
        );
      },
    );
  }

  Widget newDocumentDialog(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    Staff staff = authNotifier.user;
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
                  FutrureDropdownMenu<Staff>(
                    modelType: Staff.classType,
                    toList: (allData) {
                      return allData
                          .map(
                              (e) => DropdownMenuEntry(value: e, label: e.name))
                          .toList();
                    },
                    onSelected: (value) =>
                        context.read<FilePickerNotifier>().staff = value!,
                    text: "Owner",
                    initialSelection: context.read<FilePickerNotifier>().staff,
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
                if (selectedFiles.isEmpty) return;
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
                              widget.subcategory,
                              aircraft,
                            );
                            if (!context.mounted) return;
                            Navigator.pop(context, 'Apply');
                            Navigator.pop(context, 'Apply');
                            setState(() {});
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
