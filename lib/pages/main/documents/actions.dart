import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/Document.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/edit_document_view.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocumentActions extends ConsumerWidget {
  const DocumentActions({
    super.key,
    required this.document,
  });

  final Document document;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(isAdminProvider);
    final controller = MenuController();
    return MenuAnchor(
      controller: controller,
      menuChildren: [
        IconButton(
          onPressed: () async {
            await getFileUrl(document);
            controller.close();
          },
          icon: const Icon(Icons.download_outlined),
          tooltip: "Download",
        ),
        if (isAdmin)
          IconButton(
            onPressed: () async {
              controller.close();
              showDialog(
                context: context,
                builder: (context) {
                  return EditDocumentView(document: document);
                },
              );
            },
            icon: const Icon(Icons.edit_outlined),
          ),
        if (isAdmin)
          IconButton(
            onPressed: () async {
              final result = await showConfirmDialog(
                context,
                Text("Are you sure?"),
                Text(
                  "Do you want to ${document.archived ? "unarchive" : "archive"} this document?",
                ),
              );
              if (result) {
                await archive(document);
                ref.invalidate(documentsRepoProvider);
                controller.close();
              }
            },
            icon: Icon(
              document.archived
                  ? Icons.unarchive_outlined
                  : Icons.archive_outlined,
            ),
            tooltip: document.archived
                ? "Unarchive this document"
                : "Archive this document",
          ),
        if (isAdmin)
          IconButton(
            onPressed: () async {
              final result = await showConfirmDialog(
                context,
                Text("Are you sure?"),
                Text("Do you want to delete this document?"),
              );
              if (result) {
                await deleteDocument(document);
                controller.close();
                ref.invalidate(documentsRepoProvider);
              }
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
}
