import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/multi_select.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/documents_route/s3.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class AddADocumentWidget extends StatelessWidget {
  const AddADocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536),
        child: SingleChildScrollView(
          child: Card(
            elevation: 20,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const AddADocument(),
            ),
          ),
        ),
      ),
    );
  }
}

class AddADocument extends StatefulWidget {
  const AddADocument({super.key});

  @override
  State<AddADocument> createState() => _AddADocumentState();
}

class _AddADocumentState extends State<AddADocument> {
  Subcategory? subcategory;
  List<Aircraft> aircraft = [];
  Staff? staff;
  FilePickerResult? filePickerResult;
  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    staff = authNotifier.user;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text(
            'Add a Document',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(),
        Row(
          children: [
            // if (authNotifier.isAdmin || authNotifier.isEditor)
            //   const Expanded(child: Placeholder()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: staff?.subcategories?.map(
                        (e) {
                          return DropdownMenuEntry(
                              value: e.subcategory, label: e.subcategory!.name);
                        },
                      ).toList() ??
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
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MultiSelect<Aircraft>(
                  items: staff?.aircraft?.map(
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
              ),
            ),
          ],
        ),
        const Divider(),
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxHeight: 200),
            child: Card(
              borderOnForeground: true,
              elevation: 8,
              child: ListView(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                children: filePickerResult?.files.map(
                      (file) {
                        return Container(
                          padding: const EdgeInsets.all(2),
                          child: Chip(
                            label: Text(file.name),
                            onDeleted: () {
                              setState(
                                () {
                                  filePickerResult!.files.remove(file);
                                },
                              );
                            },
                          ),
                        );
                      },
                    ).toList() ??
                    [],
              ),
            ),
          ),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                context.go('/documents');
              },
              label: const Text('Cancel'),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  filePickerResult = await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.any,
                    withData: false,
                    // Ensure to get file stream for better performance
                    withReadStream: true,
                  );
                  setState(() {});
                },
                child: const Text("Pick file"),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {
                if (filePickerResult == null) {
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
                              filePickerResult!,
                              staff!,
                              subcategory!,
                              aircraft,
                            );
                            if (!context.mounted) return;
                            Navigator.pop(context, 'Apply');
                            context.go('/documents');
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
        )
      ],
    );
  }
}
