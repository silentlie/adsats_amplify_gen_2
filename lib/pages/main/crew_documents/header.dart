import 'package:adsats_amplify_gen_2/models/CrewDocumentCategory.dart';
import 'package:adsats_amplify_gen_2/models/Staff.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/new_crew_document.dart';
import 'package:adsats_amplify_gen_2/pages/main/crew_documents/repo.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CrewDocumentHeader extends ConsumerWidget {
  const CrewDocumentHeader({
    super.key,
    required this.staff,
    required this.category,
  });
  final Staff staff;
  final CrewDocumentCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(crewDocumentFilterProvider(staff, category));
    final filterNotifier = ref.read(
      crewDocumentFilterProvider(staff, category).notifier,
    );
    final currentPath = GoRouter.of(context).state.uri.path;
    final isProfileRoute = currentPath == ProfileRoute().location;
    final text = Text(
      '${staff.name}\'s ${category.name}',
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
              onPressed: () => ref.invalidate(crewDocumentsRepoProvider),
              icon: const Icon(Icons.refresh),
            ),
            //Could enable admin to add documents as well
            if (isProfileRoute)
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return NewCrewDocument(
                        category: category,
                      );
                    },
                  );
                },
                label: const Text('Add crew documents'),
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
                    return CrewDocumentFilterView(
                      category: category,
                      staff: staff,
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
                filterNotifier.search(value);
              },
              initialValue: filter.search,
            )
          ],
        ),
      ),
    );
  }
}
