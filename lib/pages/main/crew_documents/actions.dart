import 'package:adsats_amplify_gen_2/API/mutations.dart' hide delete;
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CrewDocumentActions extends ConsumerWidget {
  const CrewDocumentActions({
    super.key,
    required this.crewDocument,
  });
  final CrewDocument crewDocument;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = MenuController();
    final isAdmin = ref.watch(isAdminProvider);
    return MenuAnchor(
      controller: controller,
      menuChildren: [
        IconButton(
          onPressed: () async {
            await getCrewDocumentFileUrl(crewDocument);
          },
          icon: const Icon(Icons.download_outlined),
          tooltip: "Download",
        ),
        if (isAdmin)
        IconButton(
          onPressed: () async {
            final result = await showConfirmDialog(
              context,
              Text("Are you sure?"),
              Text(
                "Do you want to ${crewDocument.archived ? "unarchive" : "archive"} this crew document?",
              ),
            );
            if (result) {
              await update(
                  crewDocument.copyWith(archived: !crewDocument.archived));
              ref.invalidate(crewDocumentsRepoProvider);
              controller.close();
            }
          },
          icon: Icon(
            crewDocument.archived
                ? Icons.unarchive_outlined
                : Icons.archive_outlined,
          ),
          tooltip: crewDocument.archived
              ? "Unarchive this crew document"
              : "Archive this crew document",
        ),
        if (isAdmin)
        IconButton(
          onPressed: () async {
            final result = await showConfirmDialog(
              context,
              Text("Are you sure?"),
              Text(
                  "Do you want to delete this crew document?\nIt also deletes its documents"),
            );
            if (result) {
              await deleteCrewDocument(crewDocument);
              ref.invalidate(crewDocumentsRepoProvider);
              controller.close();
            }
          },
          icon: const Icon(Icons.delete_outline),
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
