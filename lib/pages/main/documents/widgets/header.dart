import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/documents.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/widgets/new.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';

@Dependencies([listStaff, SelectedFiles])
class DocumentsHeader extends ConsumerWidget {
  const DocumentsHeader({
    super.key,
    required this.subcategory,
  });
  final Subcategory subcategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(documentFilterProvider(subcategory));
    final filterNotifier = ref.read(
      documentFilterProvider(subcategory).notifier,
    );
    final text = Text(
      subcategory.name,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
    final orientation = MediaQuery.orientationOf(context);
    final isLandscape = orientation == Orientation.landscape;
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: isLandscape ? text : null,
      title: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 5),
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: [
            IconButton(
              onPressed: () => ref.invalidate(documentsProvider),
              icon: const Icon(Icons.refresh),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return NewDocumentView(
                      subcategory: subcategory,
                    );
                  },
                );
              },
              label: const Text('Add documents'),
              icon: const Icon(
                Icons.add,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 10,
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
            const SizedBox(
              width: 10,
            ),
            SearchBarWidget(
              onSubmitted: (value) {
                filterNotifier.search(value);
              },
              initialValue: filter.search,
            ),
            IconButton(
              icon: Icon(Icons.cancel_outlined),
              onPressed: () {
                context.canPop() ? context.pop() : DocumentsRoute().go(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
