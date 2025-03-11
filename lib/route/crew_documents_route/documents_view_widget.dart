import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/file_picker_notifier.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/crew_documents_route/filter.dart';
import 'package:adsats_amplify_gen_2/route/crew_documents_route/s3.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DocumentsViewWidget extends StatefulWidget {
  const DocumentsViewWidget({
    super.key,
    required this.staff,
    required this.category,
  });
  final Staff staff;
  final CrewDocumentCategory category;

  @override
  State<DocumentsViewWidget> createState() => _DocumentsViewWidgetState();
}

class _DocumentsViewWidgetState extends State<DocumentsViewWidget> {
  late final Filter filter;

  @override
  void initState() {
    filter = Filter(
      staffId: widget.staff.id,
      categoryId: widget.category.id,
      archived: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchDocuments(filter),
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
                      builder: (context) => newDocumentDialog(
                        context,
                        widget.staff,
                        widget.category,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                  label: const Text('Add a document'),
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
                (crewDocument) => ListTile(
                  leading: Icon(Icons.description_outlined),
                  title: Text(crewDocument.name),
                  trailing: getActions(crewDocument, widget.staff),
                  subtitle: Text([
                    crewDocument.archived ? "Archived" : "Active",
                    DateFormat('dd/MM/yyyy').format(
                      crewDocument.createdAt!.getDateTimeInUtc(),
                    ),
                    if (crewDocument.staff != null) crewDocument.staff!.name,
                  ].join(" - ")),
                  titleAlignment: ListTileTitleAlignment.center,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<Iterable<CrewDocument>> fetchDocuments(Filter filter) async {
    try {
      final request = GraphQLRequest<String>(
        document: listCrewDocuments,
        variables: filter.toJson(),
      );
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final documents = (jsonMap["listCrewDocuments"]["items"] as List).map(
        (e) => CrewDocument.fromJson(e),
      );
      return documents;
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchCrewDocumentsMeta failed: $e');
      rethrow;
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchCrewDocumentsMeta failed: $e');
      rethrow;
    }
  }

  Widget getActions(CrewDocument document, Staff staff) {
    return MenuAnchor(
      menuChildren: [
        IconButton(
          onPressed: () async {
            await getFileUrl(document, staff);
          },
          icon: const Icon(Icons.download_outlined),
          tooltip: "Download",
        ),
        IconButton(
          onPressed: () async {
            await archive(document);
            setState(() {});
          },
          icon: const Icon(Icons.archive_outlined),
          tooltip: "Archive",
        ),
        IconButton(
          onPressed: () async {
            await delete(document, staff);
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

  Widget newDocumentDialog(
    BuildContext context,
    Staff staff,
    CrewDocumentCategory category,
  ) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
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
          content: Consumer<FilePickerNotifier>(
            builder: (context, filePickerProvider, child) {
              return SingleChildScrollView(
                child: Column(
                  children: filePickerProvider.selectedFiles.map((file) {
                    return Chip(
                      label: Text(file.name),
                      onDeleted: () {
                        filePickerProvider.removeFile(file);
                      },
                    );
                  }).toList(),
                ),
              );
            },
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
                            await uploadFiles(selectedFiles, staff, category);
                            if (!context.mounted) return;
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
