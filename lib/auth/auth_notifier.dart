import 'dart:convert';

import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class AuthNotifier with ChangeNotifier {
  bool isSignedIn = false;
  late String id;
  late Staff user;
  bool isAdmin = false;
  bool isEditor = false;
  List<Aircraft> aircraft = [];
  List<Role> roles = [];
  Map<Subcategory, int> subcategories = {};
  List<Notice> notifications = [];

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
      final response = await Amplify.API
          .query(
            request: ModelQueries.get(
              Staff.classType,
              StaffModelIdentifier(id: id),
            ),
          )
          .response;
      if (response.data == null) {
        return false;
      }
      user = response.data!;
      await _queryUserDetails(id);
      _validateRoles();
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
    // TODO need to rewrite this
    const document = '''
    query GetStaffDetails(\$id: String!) {
      getStaff(id: \$id) {
        aircraft {
          items {
            aircraft {
              id
              name
              archived
            }
          }
        }
        roles {
          items {
            role {
              id
              name
            }
          }
        }
        subcategories {
          items {
            accessLevel
            subcategory {
              id
              name
            }
          }
        }
        notifications(filter: {read_at: {attributeExists: false}}) {
          items {
            notice {
              archived
              deadline_at
              type
              subject
              status
            }
          }
        }
      }
    }
    ''';
    final response = await Amplify.API
        .query(
          request: GraphQLRequest(
            document: document,
            variables: {
              "id": id,
            },
          ),
        )
        .response;
    if (response.data == null) {
      throw Exception('No data returned from API');
    }
    Map<String, dynamic> jsonMap = json.decode(response.data);

    // TODO: need to change to map
    // Helper function to populate a list from JSON
    void populateList<T>(
      String key,
      List<T> targetList,
      T Function(Map<String, dynamic>) fromJson,
    ) {
      targetList.clear();

      final items = List<Map<String, dynamic>>.from(
        jsonMap['getStaff'][key]['items'],
      );
      for (var json in items) {
        targetList.add(fromJson(json));
      }
    }

    // Populate roles, aircraft, and notifications
    populateList('roles', roles, (json) {
      return Role.fromJson(json['role']);
    });
    populateList('aircraft', aircraft, (json) {
      return Aircraft.fromJson(json['aircraft']);
    });
    populateList('notifications', notifications, (json) {
      return Notice.fromJson(json['notice']);
    });

    // Handle subcategories separately since it's a Map
    final subcategoriesJson = List<Map<String, dynamic>>.from(
      jsonMap['getStaff']['subcategories']['items'],
    );
    for (var json in subcategoriesJson) {
      subcategories[Subcategory.fromJson(
        json['subcategory'],
      )] = json['accessLevel'];
    }
  }

  void _validateRoles() {
    isAdmin = roles.any((role) {
      return role.id == "b297e54e-720e-4164-8df9-29c2af3035af";
    });
    isEditor = roles.any((role) {
      return role.id == "0fcda9a3-0676-4092-85a3-cea0a780b63a";
    });
  }
}
