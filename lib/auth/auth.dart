import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/ModelProvider.dart';

part 'auth.g.dart';

@riverpod
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

@riverpod
Future<Staff> userDetails(Ref ref) async {
  final id = await ref.watch(userIdProvider.future);
  return await Amplify.API
      .query(
        request: GraphQLRequest(
          document: getStaff,
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

@riverpod
bool isAdmin(Ref ref) {
  return ref.watch(
        userDetailsProvider.select(
          (user) {
            return user.valueOrNull?.roles?.any(
              (role) {
                return role.role?.name == "Admin";
              },
            );
          },
        ),
      ) ??
      false;
}

@riverpod
bool isSafetyOfficer(Ref ref) {
  return ref.watch(
        userDetailsProvider.select(
          (user) {
            return user.valueOrNull?.roles?.any(
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

@riverpod
bool isQualityManager(Ref ref) {
  return ref.watch(
        userDetailsProvider.select(
          (user) {
            return user.valueOrNull?.roles?.any(
              (role) {
                final roleName = role.role?.name;
                return roleName == "Quality Manager" || roleName == "Admin";
              },
            );
          },
        ),
      ) ??
      false;
}
