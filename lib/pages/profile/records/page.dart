import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/widgets/records.dart';
import 'package:adsats_amplify_gen_2/pages/profile/records/repo.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileRecordsPage extends ConsumerWidget {
  const ProfileRecordsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1536),
        child: Card(
          child: AsyncValueWidget(
            value: ref.watch(profileRepoProvider),
            data: (value) {
              return ProfileDocumentsView(
                roles: value,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ProfileDocumentsView extends HookConsumerWidget {
  const ProfileDocumentsView({super.key, required this.roles});
  final Iterable<Role> roles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDetailsProvider.select((value) => value.value!));
    final tabCon = useTabController(initialLength: roles.length);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text(
            'Profile Records',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        TabBar(
          controller: tabCon,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          tabs: roles.map(
            (e) {
              return Tab(
                text: e.name,
                icon: Icon(Icons.group_outlined),
              );
            },
          ).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: tabCon,
            children: roles.map(
              (e) {
                return Column(
                  children: e.categories!.map(
                    (category) {
                      return ListTile(
                        title: Text(category.name),
                        leading: Icon(Icons.category_outlined),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: FlightCrewRecordsView(
                                  staff: user,
                                  category: category,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ).toList(),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
