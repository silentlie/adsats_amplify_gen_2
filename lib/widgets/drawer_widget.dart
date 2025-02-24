import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/to_string.dart';
import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/default_logo_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/future_value_widget.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  void _close(BuildContext context) {
    Scaffold.of(context).closeEndDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeaderWidget(),
          const Divider(),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              ProfileRoute().push(context);
              _close(context);
            },
          ),
          ListTile(
            title: const Text('Reset password'),
            onTap: () {
              ResetPasswordRoute().push(context);
              _close(context);
            },
          ),
          if (ref.watch(isAdminProvider))
            ListTile(
              title: const Text('Admin'),
              onTap: () {
                //TODO admin path
              },
            ),
          ListTile(
            title: const Text('Help'),
            onTap: () {
              HelpRoute().push(context);
              _close(context);
            },
          ),
          ListTile(
            title: const Text('About this app'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: const DefaultLogoWidget(),
                applicationName: "ADSATS App",
                applicationVersion: "3.0.0",
              );
              _close(context);
            },
          ),
          SignOutButton(),
        ],
      ),
    );
  }
}

class DrawerHeaderWidget extends ConsumerWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(
      userDetailsProvider.select(
        (asyncValue) => asyncValue.valueOrNull,
      ),
    );
    Widget? avatar;
    avatar = const DefaultLogoWidget();
    return FutureValueWidget(
      value: user,
      data: (user) {
        return Column(
          children: [
            Center(child: avatar),
            const SizedBox(height: 10),
            Center(
              child: Text(
                user.name,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                user.email,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                'Roles: ${listToString(user.roles ?? [])}',
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                'Aircraft: ${listToString(user.aircraft ?? [])}',
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                'Subcategories: ${listToString(user.subcategories ?? [])}',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
