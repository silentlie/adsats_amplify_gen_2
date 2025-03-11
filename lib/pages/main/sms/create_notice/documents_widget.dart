import 'package:adsats_amplify_gen_2/helper/selected_files.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create_notice/state.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoticeDocumentsWidget extends ConsumerWidget {
  const NoticeDocumentsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final newFiles = ref.watch(selectedFilesProvider);
    final uploadedFiles = ref.watch(
      noticeNotifierProvider.select(
        (value) => value.notice.documents!,
      ),
    );
    final notifier = ref.read(noticeNotifierProvider.notifier);
    final isEditMode = ref.watch(noticeNotifierProvider.select(
      (value) => value.editMode,
    ));
    final children = <Widget>[
      Text("Documents: "),
      if (newFiles.isEmpty && uploadedFiles.isEmpty) Text("None"),
      ...uploadedFiles.map(
        (document) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                getFileUrl(
                  document,
                  ref.read(noticeNotifierProvider).notice,
                );
              },
              child: Chip(
                label: Text(document.name),
                color: WidgetStatePropertyAll(colorScheme.onPrimary),
                onDeleted: isEditMode
                    ? () => notifier.removeNoticeDocument(document)
                    : null,
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
