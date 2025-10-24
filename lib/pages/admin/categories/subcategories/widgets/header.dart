import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/subcategories.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/widgets/filter.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/admin/categories/subcategories/widgets/subcategory.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SubcategoryHeader extends ConsumerWidget {
  const SubcategoryHeader({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(subcategoryFilterProvider(category.id));
    final text = Text(
      category.name,
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
                  CategoriesRoute().go(context);
                }
              },
              icon: const Icon(Icons.arrow_back),
            ),
            IconButton(
              onPressed: () => ref.invalidate(subcategoriesProvider),
              icon: const Icon(Icons.refresh),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SubcategoryView(
                      categoryId: category.id,
                    );
                  },
                );
              },
              label: const Text('Add a subcategory'),
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
                    return SubcategoryFilterView(
                      categoryId: category.id,
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
                    .read(subcategoryFilterProvider(category.id).notifier)
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
