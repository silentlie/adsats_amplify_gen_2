part of 'route.dart';

class CrewDocumentsPage extends ConsumerWidget {
  const CrewDocumentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1536),
        child: Card(
          child: AsyncValueWidget(
            value: ref.watch(crewDocumentsMetaProvider),
            data: (value) {
              final (aircraft, roles) = value;
              return CrewDocumentsBody(aircraft: aircraft, roles: roles);
            },
          ),
        ),
      ),
    );
  }
}

class CrewDocumentsBody extends HookConsumerWidget {
  const CrewDocumentsBody({
    super.key,
    required this.aircraft,
    required this.roles,
  });
  final Iterable<Aircraft> aircraft;
  final Iterable<Role> roles;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  text: e.name,
                  icon: Icon(Icons.airplanemode_on_outlined),
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
                              text: e.name,
                              icon: Icon(Icons.groups_2_outlined),
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
    return AsyncValueWidget(
      value: ref.watch(listJoinStaffProvider(aircraft, role)),
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
                              child: CrewDocumentsView(
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
