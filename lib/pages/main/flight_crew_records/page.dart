import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/fav_sort.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/providers/records.dart';
import 'package:adsats_amplify_gen_2/pages/main/flight_crew_records/widgets/records.dart';
import 'package:adsats_amplify_gen_2/settings/settings.dart';
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
            // TODO: FutureWidget
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
  FlightCrewRecordsBody({
    super.key,
    required this.aircraft,
    required Iterable<Role> roles,
  }) : roles = roles.where((r) => !blocked.contains(r.name));

  static const blocked = [admin, safetyOfficer, complianceManager];
  final Iterable<Aircraft> aircraft;
  final Iterable<Role> roles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(
      settingsNotifierProvider.select(
        (v) => v.value?.flightCrewRecordFavourites ?? <String, List<String>>{},
      ),
    );
    final notifier = ref.read(settingsNotifierProvider.notifier);

    // Sort aircraft once per build based on current favourites
    final sortedAircraft = useMemoized(
      () => aircraft.sortedByFav(
        isFav: (a) => favourites.containsKey(a.name),
        getField: (a) => a.name,
      ),
      // recompute when list or favourites change
      [aircraft, favourites],
    );

    final aircraftTabCon = useTabController(
      initialLength: sortedAircraft.length,
    );

    return Column(
      children: [
        TabBar(
          controller: aircraftTabCon,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          tabs: [
            for (final a in sortedAircraft)
              Tab(
                icon: Row(
                  children: [
                    const Icon(Icons.airplanemode_on_outlined),
                    IconButton(
                      onPressed: () {
                        final next = _toggleAircraftFav(favourites, a.name);
                        notifier.setFlightCrewRecordFavourites(next);
                      },
                      icon: Icon(
                        favourites.containsKey(a.name)
                            ? Icons.star
                            : Icons.star_border,
                      ),
                      tooltip: 'Favourite ${a.name}',
                    ),
                  ],
                ),
                text: a.name,
              ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: aircraftTabCon,
            children: [
              for (final a in sortedAircraft)
                _RolesPane(
                  aircraft: a,
                  allRoles: roles,
                  favourites: favourites,
                  onToggleRole: (roleName) {
                    final updated = _toggleRoleFav(
                      favourites,
                      a.name,
                      roleName,
                    );
                    notifier.setFlightCrewRecordFavourites(updated);
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }

  Map<String, List<String>> _toggleAircraftFav(
    Map<String, List<String>> favs,
    String aircraftName,
  ) {
    final next = Map<String, List<String>>.from(favs);
    if (next.containsKey(aircraftName)) {
      next.remove(aircraftName);
    } else {
      next[aircraftName] = <String>[];
    }
    return next;
  }

  Map<String, List<String>> _toggleRoleFav(
    Map<String, List<String>> favs,
    String aircraftName,
    String roleName,
  ) {
    final next = Map<String, List<String>>.from(favs);
    final roles = List<String>.from(next[aircraftName] ?? const <String>[]);
    if (roles.contains(roleName)) {
      roles.remove(roleName);
    } else {
      roles.add(roleName);
    }
    next[aircraftName] = roles;
    return next;
  }
}

class _RolesPane extends HookWidget {
  const _RolesPane({
    required this.aircraft,
    required this.allRoles,
    required this.favourites,
    required this.onToggleRole,
  });

  final Aircraft aircraft;
  final Iterable<Role> allRoles;
  final Map<String, List<String>> favourites;
  final void Function(String roleName) onToggleRole;

  @override
  Widget build(BuildContext context) {
    // Roles sorted for THIS aircraft only
    final rolesFav = favourites[aircraft.name] ?? const <String>[];
    final sortedRoles = useMemoized(
      () => allRoles.sortedByFav(
        isFav: (r) => rolesFav.contains(r.name),
        getField: (r) => r.name,
        ascending: false,
      ),
      [allRoles, rolesFav],
    );

    final rolesTabCon = useTabController(
      initialLength: sortedRoles.length,
    );

    return Column(
      children: [
        TabBar(
          controller: rolesTabCon,
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          tabs: [
            for (final role in sortedRoles)
              Tab(
                icon: Row(
                  children: [
                    const Icon(Icons.groups_2_outlined),
                    IconButton(
                      onPressed: () => onToggleRole(role.name),
                      icon: Icon(
                        _isRoleFav(favourites, aircraft.name, role.name)
                            ? Icons.star
                            : Icons.star_border,
                      ),
                      tooltip: 'Favourite ${role.name}',
                    ),
                  ],
                ),
                text: role.name,
              ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: rolesTabCon,
            children: [
              for (final role in sortedRoles)
                CrewsView(
                  aircraft: aircraft,
                  role: role,
                ),
            ],
          ),
        ),
      ],
    );
  }

  bool _isRoleFav(
    Map<String, List<String>> favs,
    String aircraftName,
    String roleName,
  ) =>
      (favs[aircraftName] ?? const <String>[]).contains(roleName);
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
    return AsyncValueWidget(
      // TODO: FutureWidget
      value: ref.watch(joinStaffProvider(aircraft, role)),
      data: (value) {
        return ListView(
          shrinkWrap: true,
          children: value.map(
            (e) {
              return ExpansionTile(
                title: Text(e.fullName),
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
