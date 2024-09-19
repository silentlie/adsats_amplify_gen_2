import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class AuthNotifier with ChangeNotifier {
  bool isSignedIn = false;
  late Staff user;
  bool isAdmin = false;
  bool isEditor = false;
  List<Staff> staff = [];

  Future<bool> fetchCognitoAuthSession() async {
    try {
      final cognitoPlugin =
          Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      String id = await cognitoPlugin.fetchAuthSession().then(
        (response) {
          isSignedIn = response.isSignedIn;
          return response.toJson()["userSub"].toString();
        },
      );
      await Future.wait([
        _queryUserDetails(id),
        listStaff(),
      ]);
      _validateRoles();
      _validateSubcategories();
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

  Future<void> _queryUserDetails(String id) async {
    final response = await Amplify.API
        .query(
          request: GraphQLRequest(
            document: getStaffDetails,
            variables: {
              "id": id,
            },
          ),
        )
        .response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    Map<String, dynamic> jsonMap = json.decode(response.data);
    user = Staff.fromJson(jsonMap['getStaff']);
  }

  void _validateRoles() {
    isAdmin = user.roles!.any((role) {
      return role.role!.name == "Admin";
    });
    isEditor = user.roles!.any((role) {
      return role.role!.id == "Editor";
    });
  }

  void _validateSubcategories() {
    user = user.copyWith(
        subcategories: user.subcategories?.where(
      (element) {
        return element.accessLevel == 1 || element.accessLevel == 2;
      },
    ).toList());
  }

  Future<void> listStaff() async {
    final request = ModelQueries.list(Staff.classType);
    final response = await Amplify.API.query(request: request).response;

    if (response.errors.isNotEmpty) {
      debugPrint('errors: ${response.errors}');
    }
    staff = List<Staff>.from(response.data!.items);
  }
}
