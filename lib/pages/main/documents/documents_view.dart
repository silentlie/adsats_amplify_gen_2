import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/confirm_dialog.dart';
import 'package:adsats_amplify_gen_2/widgets/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/new_document.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/s3.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DocumentsView extends ConsumerWidget {
  const DocumentsView({
    super.key,
    required this.subcategory,
  });
  final Subcategory subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(documentFilterProvider(subcategory));
    final documentsAsync = ref.watch(
      documentsRepoProvider(filter),
    );
    var widgets = documentsAsync.when<List<Widget>>(
      data: (documents) {
        return documents.map(
          (document) {
            return ListTile(
              leading: Icon(Icons.description_outlined),
              title: Text(document.name),
              trailing: DocumentActions(
                document: document,
                reload: () {
                  ref.invalidate(documentsRepoProvider(filter));
                },
              ),
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
              onTap: () => getFileUrl(document),
            );
          },
        ).toList();
      },
      error: (error, stackTrace) {
        final colorScheme = ColorScheme.of(context);
        return [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              error.toString(),
              style: TextStyle(color: colorScheme.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton.icon(
              onPressed: () {
                ref.invalidate(documentsRepoProvider(filter));
              },
              label: Text("Retry"),
              icon: Icon(Icons.refresh),
            ),
          ),
        ];
      },
      loading: () => [LoadingView()],
    );
    if (widgets.isEmpty) {
      widgets = [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("There is no document"),
        ),
      ];
    }
    return Column(
      children: [
        ListTile(
          leading: ElevatedButton.icon(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => NewDocumentDialog(
                  subcategory: subcategory,
                ),
              );
              ref.invalidate(documentsRepoProvider(filter));
            },
            label: const Text('Add a document'),
            icon: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
          title: SearchBarWidget(
            onSubmitted: (value) {
              ref
                  .read(documentFilterProvider(subcategory).notifier)
                  .search(value);
            },
            initialValue: filter.search,
          ),
          trailing: Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  ref.invalidate(documentsRepoProvider(filter));
                },
                label: Text("Refresh"),
                icon: Icon(Icons.refresh_outlined),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DocumentsFilterView(subcategory: subcategory);
                    },
                  );
                },
                label: Text("Filter"),
                icon: Icon(Icons.filter_alt_outlined),
              ),
            ],
          ),
        ),
        ...widgets
      ],
    );
  }
}

class DocumentsFilterView extends ConsumerWidget {
  const DocumentsFilterView({
    super.key,
    required this.subcategory,
  });

  final Subcategory subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(documentFilterProvider(subcategory));
    return AlertDialog.adaptive(
      title: const Text('Filter By:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalDropdownMenu(
            entries: const [
              DropdownMenuEntry(value: false, label: "False"),
              DropdownMenuEntry(value: true, label: "True"),
              DropdownMenuEntry(value: null, label: "All"),
            ],
            onSelected: (value) {
              filter = filter.copyWith(archived: value);
            },
            initialSelection: filter.archived,
            text: "Archived",
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: DateTimeRangePicker(
              text: "Select document date range",
              onSubmitted: (value) {
                filter = filter.copyWith(createdAt: value);
              },
              initialDateRange: filter.createdAt,
            ),
          ),
        ],
      ),
      actions: [
        // cancel
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            ref.invalidate(documentFilterProvider(subcategory));
            Navigator.pop(context, 'Apply');
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref.read(documentFilterProvider(subcategory).notifier).apply(
                  filter,
                );
            Navigator.pop(context, 'Apply');
          },
          child: const Text('Apply'),
        )
      ],
    );
  }
}

class DocumentActions extends ConsumerWidget {
  const DocumentActions({
    super.key,
    required this.document,
    required this.reload,
  });

  final Document document;

  final VoidCallback reload;

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
              final result = await showConfirmDialog(
                context,
                Text("Are you sure?"),
                Text(
                  "Do you want to ${document.archived ? "unarchive" : "archive"} this document?",
                ),
              );
              if (result) {
                await archive(document);
                reload();
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
                reload();
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
