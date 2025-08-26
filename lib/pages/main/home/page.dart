
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/notification/notifications.dart';
import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/navigate_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsWidgets = buildNotifications(context, ref);
    final userName = ref.watch(
      userDetailsProvider.select(
        (value) => value.value?.firstName,
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
                    title: Text("There are no pending notices"),
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
                      icon: CmsShellRouteData().icon.icon!,
                      name: CmsShellRouteData().label,
                      onPressed: () => CmsSentRoute().go(context),
                    ),
                    NavigateIconButton(
                      icon: FlightCrewRecordsRoute().icon.icon!,
                      name: FlightCrewRecordsRoute().label,
                      onPressed: () => FlightCrewRecordsRoute().go(context),
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
                        onPressed: () => AircraftRoute().push(context),
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
