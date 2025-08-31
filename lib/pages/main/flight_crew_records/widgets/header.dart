import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/FlightCrewRecordCategory.dart';
import 'package:adsats_amplify_gen_2/models/Staff.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/providers/records.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/widgets/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/widgets/new.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FlightCrewRecordsHeader extends ConsumerWidget {
  const FlightCrewRecordsHeader({
    super.key,
    required this.staff,
    required this.category,
  });
  final Staff staff;
  final FlightCrewRecordCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(flightCrewRecordFilterProvider(staff, category));
    final filterNotifier = ref.read(
      flightCrewRecordFilterProvider(staff, category).notifier,
    );
    final currentPath = GoRouter.of(context).state.uri.path;
    final isProfileRoute = currentPath == ProfileRoute().location;
    final text = Text(
      '${staff.firstName} ${staff.lastName}\'s ${category.name}',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
    final isAdmin = ref.watch(isAdminProvider);
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
              onPressed: () => ref.invalidate(recordsProvider),
              icon: const Icon(Icons.refresh),
            ),
            //Could enable admin to add documents as well
            if (isProfileRoute || isAdmin)
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return NewFlightCrewRecord(
                        category: category,
                        staff: staff,
                      );
                    },
                  );
                },
                label: const Text('Add Flight Crew Records'),
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
                    return FlightCrewRecordFilterView(
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
            ),
            IconButton(
              icon: Icon(Icons.cancel_outlined),
              onPressed: () {
                context.canPop()
                    ? context.pop()
                    : FlightCrewRecordsRoute().go(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
