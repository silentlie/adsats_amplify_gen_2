import 'package:adsats_amplify_gen_2/models/Staff.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class AuthNotifier with ChangeNotifier {
  late bool isSignedIn;
  late String id;
  late Staff user;

  Future<bool> fetchCognitoAuthSession() async {
    try {
      final cognitoPlugin =
          Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      await cognitoPlugin.fetchAuthSession().then(
        (response) {
          isSignedIn = response.isSignedIn;
          id = response.toJson()["userSub"].toString();
        },
      );
      await Amplify.API
          .query(
            request: ModelQueries.get(
              Staff.classType,
              StaffModelIdentifier(id: id),
            ),
          )
          .response
          .then(
        (response) {
          user = response.data!;
        },
      );
      return isSignedIn;
    } on SignedOutException catch (e) {
      debugPrint(
        'Error SignedOutException while retrieving auth session: ${e.message}',
      );
      rethrow;
    } on AuthException catch (e) {
      debugPrint(
        'Error AuthException while retrieving auth session: ${e.message}',
      );
      rethrow;
    } on Exception catch (e) {
      debugPrint(
        'Error Exception while retrieving auth session: $e',
      );
      rethrow;
    }
  }

}
