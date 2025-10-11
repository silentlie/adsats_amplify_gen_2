import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([SelectedFiles, NoticeForm])
class NoticeDocumentsWidget extends HookConsumerWidget {
  const NoticeDocumentsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final newFiles = ref.watch(selectedFilesProvider);
    final uploadedFiles = ref.watch(
      noticeFormProvider.select(
        (value) => value.notice.documents ?? [],
      ),
    );
    final notifier = ref.read(noticeFormProvider.notifier);
    final isEditMode = ref.watch(noticeFormProvider.select(
      (value) => value.editMode,
    ));
    final service = ref.read(noticeServiceProvider);
    final children = <Widget>[
      Text("Documents Attached: "),
      if (newFiles.isEmpty && uploadedFiles.isEmpty) Text("Nil"),
      ...uploadedFiles.map(
        (document) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                service.getFileURL(
                  document,
                  ref.read(noticeFormProvider).notice,
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
    final scrollController = useScrollController();
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
