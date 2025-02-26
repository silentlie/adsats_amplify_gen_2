part of 'route.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsWidgets = buildNotifications(context, ref);
    final userName = ref.watch(
      userDetailsProvider.select(
        (value) => value.valueOrNull?.name,
      ),
    );
    return Column(
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Welcome back $userName",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Card(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1536.0),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "Notifications:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (notificationsWidgets.isEmpty)
                  const ListTile(
                    title: Text("There is no pending notice"),
                  ),
                ...notificationsWidgets,
                TextButton.icon(
                  onPressed: () async {
                    ref.refresh(notificationsProvider).hashCode;
                  },
                  label: const Text("Refresh"),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  "Quick navigation:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  children: [
                    NavigateIconButton(
                      icon: HomeRoute().icon.icon!,
                      name: HomeRoute().label,
                      onPressed: () => HomeRoute().go(context),
                    ),
                    NavigateIconButton(
                      icon: DocumentsRoute().icon.icon!,
                      name: DocumentsRoute().label,
                      onPressed: () => DocumentsRoute().go(context),
                    ),
                    NavigateIconButton(
                      icon: SmsShellRouteData().icon.icon!,
                      name: SmsShellRouteData().label,
                      onPressed: () => SmsInboxRoute().go(context),
                    ),
                    NavigateIconButton(
                      icon: ComplianceShellRouteData().icon.icon!,
                      name: ComplianceShellRouteData().label,
                      onPressed: () => ComplianceSentRoute().go(context),
                    ),
                    NavigateIconButton(
                      icon: CrewDocumentsRoute().icon.icon!,
                      name: CrewDocumentsRoute().label,
                      onPressed: () => CrewDocumentsRoute().go(context),
                    ),
                    NavigateIconButton(
                      icon: ProfileRoute().icon.icon!,
                      name: ProfileRoute().label,
                      onPressed: () => ProfileRoute().go(context),
                    ),
                    if (ref.watch(isAdminProvider))
                      NavigateIconButton(
                        icon: AdminShellRouteData().icon.icon!,
                        name: AdminShellRouteData().label,
                        onPressed: () => HomeRoute().push(context),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
