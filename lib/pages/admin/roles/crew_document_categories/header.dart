import 'package:adsats_amplify_gen_2/helper/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/crew_document_category_view.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/roles/crew_document_categories/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CrewDocumentCategoryHeader extends ConsumerWidget {
  const CrewDocumentCategoryHeader({
    super.key,
    required this.role,
  });

  final Role role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(crewDocumentCategoryFilterProvider(role.id));
    final text = Text(
      role.name,
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
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  RolesRoute().go(context);
                }
              },
              icon: const Icon(Icons.arrow_back),
            ),
            IconButton(
              onPressed: () => ref.invalidate(crewDocumentCategoriesRepoProvider),
              icon: const Icon(Icons.refresh),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CrewDocumentCategoryView(
                      role: role,
                    );
                  },
                );
              },
              label: const Text('Add a crew document category'),
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
                    return CrewDocumentCategoryFilterView(
                      roleId: role.id,
                    );
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
                ref
                    .read(crewDocumentCategoryFilterProvider(role.id).notifier)
                    .search(value);
              },
              initialValue: filter.search,
            )
          ],
        ),
      ),
    );
  }
}
