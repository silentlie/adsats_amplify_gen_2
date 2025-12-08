import 'package:adsats_amplify_gen_2/API/queries.dart';
import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/ModelProvider.dart';

part 'auth.g.dart';

const admin = "Admin";
const safetyOfficer = "Safety Officer";
const complianceManager = "Compliance Manager";

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
  final db = ref.read(databaseAPIProvider);
  final res = await db.query(
    document: getStaffGraphQL,
    variables: {"id": id},
  );
  final user = Staff.fromJson(res['getStaff']);
  return user.copyWith(
    subcategories: user.subcategories?.where(
      (element) {
        return element.accessLevel == 1 || element.accessLevel == 2;
      },
    ).toList(),
  );
}

@riverpod
bool isAdmin(Ref ref) {
  return ref.watch(
        userDetailsProvider.select(
          (user) {
            return user.value?.roles?.any(
              (role) {
                return role.role?.name == admin;
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
            return user.value?.roles?.any(
              (role) {
                final roleName = role.role?.name;
                return roleName == safetyOfficer;
              },
            );
          },
        ),
      ) ??
      false;
}

@riverpod
bool isComplianceManager(Ref ref) {
  return ref.watch(
        userDetailsProvider.select(
          (user) {
            return user.value?.roles?.any(
              (role) {
                final roleName = role.role?.name;
                return roleName == complianceManager;
              },
            );
          },
        ),
      ) ??
      false;
}
