import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/s3.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/date_picker_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditDocumentView extends ConsumerWidget {
  const EditDocumentView({
    super.key,
    required this.document,
  });

  final Document document;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return AsyncValueWidget(
      value: ref.watch(userDetailsProvider),
      data: (user) {
        Document document = this.document;
        return AlertDialog.adaptive(
          title: Text(
            'Edit Document: ${document.name}',
            style: themeData.textTheme.headlineMedium,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GlobalTextFormField(
                  labelText: "Document name",
                  onSaved: (value) {
                    document = document.copyWith(name: value);
                  },
                  onChanged: (value) {
                    document = document.copyWith(name: value);
                  },
                  initialValue: document.name,
                  isFileName: true,
                ),
                AsyncValueWidget(
                  value: ref.watch(listStaffProvider()),
                  data: (data) {
                    return GlobalDropdownMenu<Staff>(
                      entries: data.map(
                        (e) {
                          return DropdownMenuEntry(
                            value: e,
                            label: "${e.firstName} ${e.lastName}",
                          );
                        },
                      ).toList(),
                      onSelected: (value) {
                        document = document.copyWith(staff: value);
                      },
                      initialSelection: document.staff,
                      text: "Uploader",
                    );
                  },
                ),
                GlobalDropdownMenu<Subcategory>(
                  entries: user.subcategories
                          ?.map(
                            (e) => DropdownMenuEntry(
                              value: e.subcategory!,
                              label: e.subcategory!.name,
                            ),
                          )
                          .toList() ??
                      [],
                  onSelected: (value) {
                    document = document.copyWith(subcategory: value);
                  },
                  text: "Choose a subcategory",
                  initialSelection: document.subcategory,
                ),
                GlobalDropdownMenu(
                  entries: const [
                    DropdownMenuEntry(value: false, label: "False"),
                    DropdownMenuEntry(value: true, label: "True"),
                    DropdownMenuEntry(value: null, label: "All"),
                  ],
                  onSelected: (value) {
                    document = document.copyWith(archived: value);
                  },
                  initialSelection: document.archived,
                  text: "Archived",
                ),
                // ConstrainedBox(
                //   constraints: BoxConstraints(maxWidth: 666),
                //   child: GlobalMultiSelect<Aircraft>(
                //     text: "Add aircraft",
                //     onConfirm: (selectedOptions) {
                //       document.copyWith(
                //           aircraft: selectedOptions.map(
                //         (e) {
                //           return AircraftDocument(
                //             document: document,
                //             aircraft: e,
                //           );
                //         },
                //       ).toList());
                //     },
                //     items: user.aircraft?.map(
                //           (e) {
                //             return MultiSelectItem(
                //               e.aircraft!,
                //               e.aircraft!.name,
                //             );
                //           },
                //         ).toList() ??
                //         [],
                //     initialValue: document.aircraft!.map(
                //       (e) {
                //         return e.aircraft!;
                //       },
                //     ).toList(),
                //   ),
                // ),
                DatePickerWidget(
                  text: "Issued date",
                  firstDate: DateTime.now().subtract(
                    const Duration(days: 365 * 10),
                  ),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365 * 10),
                  ),
                  onSelected: (value) {
                    document = document.copyWith(issuedAt: value);
                  },
                  initialValue: document.issuedAt,
                ),
                DatePickerWidget(
                  text: "Expired date",
                  firstDate: DateTime.now().subtract(
                    const Duration(days: 365 * 10),
                  ),
                  lastDate: DateTime.now().add(
                    const Duration(days: 365 * 10),
                  ),
                  onSelected: (value) {
                    document = document.copyWith(expiredAt: value);
                  },
                  initialValue: document.expiredAt,
                ),
              ],
            ),
          ),
          actions: [
            // cancel
            ElevatedButton.icon(
              onPressed: () async {
                final result = await showConfirmDialog(
                  context,
                  Text("Are you sure?"),
                  Text("Do you want to cancel?"),
                );
                if (!result) {
                  return;
                }
                if (!context.mounted) return;
                if (context.canPop()) {
                  context.pop();
                } else {
                  DocumentsRoute().go(context);
                }
              },
              label: const Text('Cancel'),
              icon: Icon(Icons.cancel_outlined),
            ),
            // apply
            ElevatedButton.icon(
              onPressed: () async {
                final result = await showConfirmDialog(
                  context,
                  Text("Are you sure?"),
                  Text("Do you want to apply these changes?"),
                );
                if (!result) {
                  return;
                }
                if (this.document.name != document.name) {
                  await renameDocument(this.document, document.name);
                }
                await update(document);
                ref.invalidate(documentsRepoProvider);
                if (!context.mounted) return;
                if (context.canPop()) {
                  context.pop();
                } else {
                  DocumentsRoute().go(context);
                }
              },
              style: ButtonStyle(
                // Change button background color
                backgroundColor:
                    WidgetStateProperty.all<Color>(colorScheme.secondary),
              ),
              label: Text(
                'Apply changes',
                style: TextStyle(color: colorScheme.onSecondary),
              ),
              icon: Icon(
                Icons.upload_file,
                color: colorScheme.onSecondary,
              ),
            )
          ],
        );
      },
    );
  }
}
