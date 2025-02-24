import 'package:adsats_amplify_gen_2/widgets/default_logo_widget.dart';
import 'package:adsats_amplify_gen_2/widgets/sign_out_button_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // TODO drawer header
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              //TODO profile
            },
          ),
          ListTile(
            title: const Text('Reset password'),
            onTap: () {
              //TODO resetPassword
            },
          ),
          //TODO: verify admin
          if (true)
            ListTile(
              title: const Text('Admin'),
              onTap: () {
                //TODO admin path
              },
            ),
          ListTile(
            title: const Text('Help'),
            onTap: () {
              //TODO help
            },
          ),
          ListTile(
            title: const Text('More Info'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationIcon: const DefaultLogoWidget(),
                applicationName: "ADSATS App",
                applicationVersion: "3.0.0",
              );
            },
          ),
          const SignOutButtonWidget(),
        ],
      ),
    );
  }
}
