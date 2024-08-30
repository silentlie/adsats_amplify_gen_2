import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class SignOutButtonWidget extends StatelessWidget {
  const SignOutButtonWidget({super.key});
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
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: () {
        // confirm before logout?
        signOutCurrentUser();
      },
      // Change button background color
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(colorScheme.secondary),
      ),
      child: Text(
        'Log out',
        style: TextStyle(color: colorScheme.onSecondary),
      ),
    );
  }
}
