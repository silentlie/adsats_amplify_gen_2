import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

extension StaffRoleExtension on Staff {
  bool hasActiveRole(String name) {
    return !archived &&
        (roles?.any((link) =>
                link.role?.archived == false && link.role?.name == name) ??
            false);
  }
}
