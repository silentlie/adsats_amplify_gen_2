import 'dart:convert';

import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class AuthNotifier with ChangeNotifier {
  bool isSignedIn = false;
  late String id;
  late Staff user;
  bool isAdmin = false;
  bool isEditor = false;

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
      await _queryUserDetails(id);
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
    const document = '''
    query GetStaffDetails(\$id: String!) {
      getStaff(id: \$id) {
        archived
        createdAt
        email
        id
        name
        updatedAt
        aircraft {
          items {
            aircraftId
            createdAt
            id
            staffId
            updatedAt
            aircraft {
              updatedAt
              name
              id
              description
              createdAt
              archived
            }
          }
        }
        roles {
          items {
            id
            roleId
            staffId
            createdAt
            updatedAt
            role {
              id
              name
              description
              createdAt
              archived
              updatedAt
            }
          }
        }
        subcategories {
          items {
            updatedAt
            subcategoryId
            staffId
            id
            createdAt
            accessLevel
            subcategory {
              updatedAt
              name
              id
              description
              createdAt
              categoryId
              archived
              category {
                updatedAt
                name
                id
                description
                createdAt
                archived
              }
            }
          }
        }
        notifications(filter: {read_at: {attributeExists: false}}) {
          items {
            createdAt
            id
            noticeId
            read_at
            staffId
            updatedAt
            notice {
              id
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
    user = Staff.fromJson(jsonMap['getStaff']);
  }

  void _validateRoles() {
    isAdmin = user.roles!.any((role) {
      return role.role!.id == "b297e54e-720e-4164-8df9-29c2af3035af";
    });
    isEditor = user.roles!.any((role) {
      return role.role!.id == "0fcda9a3-0676-4092-85a3-cea0a780b63a";
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
}
