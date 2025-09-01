import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/providers/records.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/widgets/records.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlightCrewRecordsPage extends ConsumerWidget {
  const FlightCrewRecordsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1536),
        child: Card(
          child: AsyncValueWidget(
            value: ref.watch(recordMetaProvider),
            data: (value) {
              final (aircraft, roles) = value;
              return FlightCrewRecordsBody(aircraft: aircraft, roles: roles);
            },
          ),
        ),
      ),
    );
  }
}

class FlightCrewRecordsBody extends HookConsumerWidget {
  const FlightCrewRecordsBody({
    super.key,
    required this.aircraft,
    required this.roles,
  });
  final Iterable<Aircraft> aircraft;
  final Iterable<Role> roles;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: add settings remembering favorite tabs
    final aircraftTabCon = useTabController(initialLength: aircraft.length);
    final rolesTabCon = useTabController(initialLength: roles.length);
    return Column(
      children: [
        TabBar(
          controller: aircraftTabCon,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          tabs: aircraft
              .map(
                (e) => Tab(
                  icon: Row(
                    children: [
                      Icon(Icons.airplanemode_on_outlined),
                      IconButton(
                        onPressed: () {
                          // TODO: implement favorite toggle
                        },
                        icon: Icon(Icons.star_border),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        e.name,
                      ),
                      // IconButton(
                      //   onPressed: () {
                      //     // TODO: implement favorite toggle
                      //   },
                      //   icon: Icon(Icons.star_border),
                      // ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: aircraftTabCon,
            children: aircraft.map(
              (aircraft) {
                return Column(
                  children: [
                    TabBar(
                      controller: rolesTabCon,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      tabs: roles
                          .map(
                            (e) => Tab(
                              icon: Row(
                                children: [
                                  Icon(Icons.groups_2_outlined),
                                  IconButton(
                                    onPressed: () {
                                      // TODO: implement favorite toggle
                                    },
                                    icon: Icon(Icons.star_border),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    e.name,
                                  ),
                                  // IconButton(
                                  //   onPressed: () {
                                  //     // TODO: implement favorite toggle
                                  //   },
                                  //   icon: Icon(Icons.star_border),
                                  // ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: rolesTabCon,
                        children: roles
                            .map(
                              (role) => CrewsView(
                                aircraft: aircraft,
                                role: role,
                              ),
                            )
                            .toList(),
                      ),
                    )
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}

class CrewsView extends ConsumerWidget {
  const CrewsView({
    super.key,
    required this.aircraft,
    required this.role,
  });
  final Aircraft aircraft;
  final Role role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(aircraft);
    print(role);
    return AsyncValueWidget(
      value: ref.watch(joinStaffProvider(aircraft, role)),
      data: (value) {
        return ListView(
          shrinkWrap: true,
          children: value.map(
            (e) {
              return ExpansionTile(
                title: Text("${e.firstName} ${e.lastName}"),
                leading: Icon(Icons.person_outline),
                children: role.categories!.map(
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
                                staff: e,
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
        );
      },
    );
  }
}
