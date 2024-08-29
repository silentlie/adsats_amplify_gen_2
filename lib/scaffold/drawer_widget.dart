import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/default_logo_widget.dart';
import 'package:adsats_amplify_gen_2/models/to_string.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Future<void> signOutCurrentUser() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      // debugPrint('Sign out completed successfully');
    } else if (result is CognitoFailedSignOut) {
      debugPrint('Error signing user out: ${result.exception.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Access color scheme
    ColorScheme colorScheme = Theme.of(context).colorScheme;
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
          ElevatedButton(
            onPressed: () {
              // confirm before logout?
              signOutCurrentUser();
            },
            // Change button background color
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(colorScheme.secondary),
            ),
            child: Text(
              'Log out',
              style: TextStyle(color: colorScheme.onSecondary),
            ),
          ),
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
            'Roles: ${listToString(authNotifier.roles)}',
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            'Aircraft: ${listToString(authNotifier.aircraft)}',
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            'Subcategories: ${mapToString(authNotifier.subcategories)}',
            textAlign: TextAlign.center,
          ),
        ),
        const Divider()
      ],
    );
  }
}
