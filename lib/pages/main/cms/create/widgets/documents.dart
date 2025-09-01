import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/form.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportDocuments extends ConsumerWidget {
  const ReportDocuments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final newFiles = ref.watch(selectedFilesProvider);
    final uploadedFiles = ref.watch(
      reportFormProvider.select(
        (value) => value.report.documents ?? [],
      ),
    );
    final notifier = ref.read(reportFormProvider.notifier);
    final isEditMode = ref.watch(reportFormProvider.select(
      (value) => value.editMode,
    ));
    final children = <Widget>[
      Text("Documents Attached: "),
      if (newFiles.isEmpty && uploadedFiles.isEmpty) Text("Nil"),
      ...uploadedFiles.map(
        (document) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                final service = ref.read(reportServiceProvider);
                service.getFileURL(
                  document,
                  ref.read(reportFormProvider).report,
                );
              },
              child: Chip(
                label: Text(document.name),
                color: WidgetStatePropertyAll(colorScheme.onPrimary),
                onDeleted:
                    isEditMode ? () => notifier.removeDocument(document) : null,
              ),
            ),
          );
        },
      ),
      ...newFiles.map(
        (e) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Chip(
              label: Text(e.name),
              color: WidgetStatePropertyAll(colorScheme.onSecondary),
              onDeleted: () {
                ref.read(selectedFilesProvider.notifier).removeFile(e);
              },
            ),
          );
        },
      )
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: children,
      ),
    );
  }
}
