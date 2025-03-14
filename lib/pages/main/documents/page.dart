part of 'route.dart';

class DocumentsPage extends ConsumerWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: AsyncValueWidget(
                  value: ref.watch(userDetailsProvider),
                  data: (user) {
                    return Column(
                      children: [
                        ListTile(
                          // contentPadding: const EdgeInsets.only(),
                          title: Text(
                            "Documents",
                            style: textTheme.titleLarge,
                          ),
                        ),
                        ...buildCategories(user, ref, context),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildCategories(
      Staff user, WidgetRef ref, BuildContext context) {
    final subcategories = user.subcategories?.map(
          (e) => e.subcategory!,
        ) ??
        [];
    return groupBy(subcategories, (e) => e.category!).entries.map(
      (entry) {
        return ExpansionTile(
          leading: Icon(Icons.view_agenda_outlined),
          title: Text(entry.key.name),
          enabled: !entry.key.archived,
          children: entry.value.map(
            (subcategory) {
              return ListTile(
                leading: Icon(Icons.view_list_outlined),
                title: Text(subcategory.name),
                enabled: !subcategory.archived,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: DocumentsView(subcategory: subcategory),
                      );
                    },
                  );
                },
              );
            },
          ).toList(),
        );
      },
    ).toList();
  }
}
