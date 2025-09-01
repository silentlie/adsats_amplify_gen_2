import 'package:adsats_amplify_gen_2/pages/main/kpi/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/widgets/filter.dart';
import 'package:adsats_amplify_gen_2/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StaffKPIHeader extends ConsumerWidget {
  const StaffKPIHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(staffKPIFilterProvider);
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: const Text(
        "Staff K.P.I",
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
              onPressed: () {
                ref.invalidate(staffKPIFilterProvider);
              },
              icon: const Icon(Icons.refresh),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StaffKPIFilterView();
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
                ref.read(staffKPIFilterProvider.notifier).search(value);
              },
              initialValue: filter.search,
            )
          ],
        ),
      ),
    );
  }
}
