import 'package:adsats_amplify_gen_2/pages/admin/aircraft/providers/aircraft.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:adsats_amplify_gen_2/pages/admin/aircraft/widgets/aircraft.dart';
import 'package:adsats_amplify_gen_2/pages/admin/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AircraftHeader extends ConsumerWidget {
  const AircraftHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(adminFilterProvider);
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Aircraft",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      title: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 5),
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: [
            IconButton(
              onPressed: () => ref.invalidate(aircraftProvider),
              icon: const Icon(Icons.refresh),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AircraftView();
                  },
                );
              },
              label: const Text('Add an aircraft'),
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
                    return AdminFilterView();
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
                ref.read(adminFilterProvider.notifier).search(value);
              },
              initialValue: filter.search,
            )
          ],
        ),
      ),
    );
  }
}
