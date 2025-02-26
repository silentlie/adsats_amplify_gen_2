import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/date_range_picker.dart';
import 'package:adsats_amplify_gen_2/helper/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/new_document.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/repo.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/s3.dart';
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
    final filter = ref.watch(filterProvider(subcategory));
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => NewDocumentDialog(
                  subcategory: subcategory,
                ),
              );
            },
            label: const Text('Add a document'),
            icon: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
          title: SearchBarWidget(
            onSubmitted: (value) {
              ref.read(filterProvider(subcategory).notifier).search(value);
            },
            initialValue: filter.search,
          ),
          trailing: ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return FilterView(subcategory: subcategory);
                },
              );
            },
            label: Text("Filter"),
            icon: Icon(Icons.filter_alt_outlined),
          ),
        ),
        ...widgets
      ],
    );
  }
}

class FilterView extends ConsumerWidget {
  const FilterView({
    super.key,
    required this.subcategory,
  });

  final Subcategory subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(filterProvider(subcategory));
    return AlertDialog.adaptive(
      title: const Text('Filter By:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: DropdownMenu<bool?>(
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: false, label: "False"),
                DropdownMenuEntry(value: true, label: "True"),
                DropdownMenuEntry(value: null, label: "All"),
              ],
              onSelected: (value) {
                filter = filter.copyWith(archived: value);
              },
              initialSelection: filter.archived,
              expandedInsets: EdgeInsets.zero,
              requestFocusOnTap: false,
              hintText: "Archived",
              label: const Text(
                "Archived",
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: DateTimeRangePicker(
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
            ref.invalidate(filterProvider(subcategory));
            Navigator.pop(context, 'Apply');
          },
          child: const Text("Reset filter"),
        ),
        // apply
        TextButton(
          onPressed: () {
            ref.read(filterProvider(subcategory).notifier).apply(
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
        if (isAdmin && !document.archived)
          IconButton(
            onPressed: () async {
              await archive(document, true);
              controller.close();
              reload();
            },
            icon: const Icon(Icons.archive_outlined),
            tooltip: "Archive",
          ),
        if (isAdmin && document.archived)
          IconButton(
            onPressed: () async {
              await archive(document, false);
              controller.close();
              reload();
            },
            icon: const Icon(Icons.unarchive_outlined),
            tooltip: "Unarchive",
          ),
        if (isAdmin)
          IconButton(
            onPressed: () async {
              await delete(document);
              controller.close();
              reload();
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
