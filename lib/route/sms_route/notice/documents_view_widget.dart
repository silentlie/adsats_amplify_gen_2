import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DocumentsViewWidget extends StatelessWidget {
  const DocumentsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Consumer<NoticeNotifier>(
      builder: (context, noticeNotifier, child) {
        final chilren = [
          Text("Documents: "),
          if (noticeNotifier.documents.isEmpty &&
              noticeNotifier.selectedFiles.isEmpty)
            Text("Empty"),
          ...noticeNotifier.documents.map(
            (document) {
              return Chip(
                label: Text(document.name),
                color: WidgetStatePropertyAll(colorScheme.onPrimary),
                onDeleted: () {
                  noticeNotifier.removeDocument(document);
                },
              );
            },
          ),
          ...noticeNotifier.selectedFiles.map(
            (file) {
              return Chip(
                label: Text(file.name),
                onDeleted: () {
                  noticeNotifier.removeFile(file);
                },
                
              );
            },
          ),
        ];
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: chilren,
          ),
        );
      },
    );
  }
}
