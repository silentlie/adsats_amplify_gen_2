part of 'route.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

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
    final user = ref.watch(userDetailsProvider).value!;
    final tabCon = useTabController(initialLength: roles.length);
    return Column(
      children: [
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
