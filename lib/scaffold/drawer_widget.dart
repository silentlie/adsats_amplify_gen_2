import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/auth/sign_out_button_widget.dart';
import 'package:adsats_amplify_gen_2/default_logo_widget.dart';
import 'package:adsats_amplify_gen_2/models/to_string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const MyDrawerHeader(),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              context.go('/profile');
            },
          ),
          ListTile(
            title: const Text('Reset password'),
            onTap: () {
              context.go('/resetPassword');
            },
          ),
          if (authNotifier.isAdmin)
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                context.go('/settings');
              },
            ),
          ListTile(
            title: const Text('Help'),
            onTap: () {
              context.go('/help');
            },
          ),
          ListTile(
            title: const Text('More Info'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: const DefaultLogoWidget(),
                applicationName: "ADSATS Web App",
                applicationVersion: "1.0.0",
              );
            },
          ),
          const SignOutButtonWidget(),
        ],
      ),
    );
  }
}

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    Widget? avatar;
    avatar = const DefaultLogoWidget();
    return Column(
      children: [
        Center(child: avatar),
        const SizedBox(height: 10),
        Center(
          child: Text(
            authNotifier.user.name,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            authNotifier.user.email,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            'Roles: ${listToString(authNotifier.user.roles ?? [])}',
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            'Aircraft: ${listToString(authNotifier.user.aircraft ?? [])}',
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            'Subcategories: ${listToString(authNotifier.user.subcategories ?? [])}',
            textAlign: TextAlign.center,
          ),
        ),
        const Divider()
      ],
    );
  }
}
