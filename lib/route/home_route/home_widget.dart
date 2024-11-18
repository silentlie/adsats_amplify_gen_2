import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/scaffold/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part 'navigate_icon_button.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late List<ListTile> notifications;

  IconData _getIcon(String? type) {
    switch (type) {
      case "Notice_to_Crew":
        return Icons.notifications_outlined;
      case "Safety_notice":
        return Icons.gpp_maybe_outlined;
      case "Hazard_report":
        return Icons.report_outlined;
      default:
        return Icons.question_mark;
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    notifications = authNotifier.user.notifications
            ?.where(
          (element) => element.read_at == null,
        )
            .map(
          (e) {
            return ListTile(
              visualDensity: VisualDensity.standard,
              tileColor: Colors.blue.shade100,
              titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              title: RichText(
                text: TextSpan(
                  text: 'Author: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: e.notice?.author?.name,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              subtitle: RichText(
                text: TextSpan(
                  text: 'Subject: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: e.notice?.subject,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              leading: Icon(_getIcon(e.notice?.type!.name)),
              onTap: () {
                context.go('/sms', extra: e.notice);
              },
            );
          },
        ).toList() ??
        [];
    return Column(
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              "Welcome back ${authNotifier.user.name}",
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
                if (notifications.isEmpty)
                  const ListTile(
                    title: Text("There is no pending notice"),
                  ),
                ...notifications,
                TextButton.icon(
                  onPressed: () async {
                    await authNotifier.fetchCognitoAuthSession();
                    setState(() {});
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
                  children: AppBarItems.menuItems.map(
                    (e) {
                      return NavigateIconButton(
                        icon: e.icon,
                        name: e.text,
                        onPressed: () {
                          context.go(e.route);
                        },
                      );
                    },
                  ).toList(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
