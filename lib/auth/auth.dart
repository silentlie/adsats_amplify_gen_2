import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/ModelProvider.dart';

part 'auth.g.dart';

@Riverpod(dependencies: [])
Future<String> userId(Ref ref) async {
  return await Amplify.Auth.getPlugin(
    AmplifyAuthCognito.pluginKey,
  ).fetchAuthSession().then(
    (response) {
      if (!response.isSignedIn) {
        throw "Auth session not found";
      }
      return response.userSubResult.value;
    },
  );
}

@Riverpod(dependencies: [userId])
Future<Staff> userDetails(Ref ref) async {
  final id = await ref.watch(userIdProvider.future);
  return await Amplify.API
      .query(
        request: GraphQLRequest(
          document: getStaffGraphQL,
          variables: {
            "id": id,
          },
        ),
      )
      .response
      .then(
    (response) {
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data);
      var user = Staff.fromJson(jsonMap['getStaff']);
      // Validate accessible subcategories
      return user.copyWith(
        subcategories: user.subcategories?.where(
          (element) {
            return element.accessLevel == 1 || element.accessLevel == 2;
          },
        ).toList(),
      );
    },
  );
}

@Riverpod(dependencies: [userDetails])
bool isAdmin(Ref ref) {
  return ref.watch(
        userDetailsProvider.select(
          (user) {
            return user.value?.roles?.any(
              (role) {
                return role.role?.name == "Admin";
              },
            );
          },
        ),
      ) ??
      false;
}

@Riverpod(dependencies: [userDetails])
bool isSafetyOfficer(Ref ref) {
  return ref.watch(
        userDetailsProvider.select(
          (user) {
            return user.value?.roles?.any(
              (role) {
                final roleName = role.role?.name;
                return roleName == "Safety Officer" || roleName == "Admin";
              },
            );
          },
        ),
      ) ??
      false;
}

@Riverpod(dependencies: [userDetails])
bool isComplianceManager(Ref ref) {
  return ref.watch(
        userDetailsProvider.select(
          (user) {
            return user.value?.roles?.any(
              (role) {
                final roleName = role.role?.name;
                return roleName == "Compliance Manager" || roleName == "Admin";
              },
            );
          },
        ),
      ) ??
      false;
}
