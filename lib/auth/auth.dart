import 'dart:convert';

import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class AuthNotifier with ChangeNotifier {
  late bool isSignedIn;
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
      await _queryUserDetails(id);
      _validateRoles();
      return isSignedIn && !user.archived!;
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

    // Helper function to populate a list from JSON
    void populateList<T>(String key, List<T> targetList,
        T Function(Map<String, dynamic>) fromJson) {
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
      subcategories[Subcategory.fromJson(json['subcategory'])] =
          json['accessLevel'];
    }
  }

  void _validateRoles() {
    isAdmin = roles.any((role) {
      return role.id == "57773f09-e69a-4783-bee7-53fd2c864ac8";
    });
    isEditor = roles.any((role) {
      return role.id == "7af4e6f7-a6d3-460f-a6df-e830ef6e31dc";
    });
  }
}
