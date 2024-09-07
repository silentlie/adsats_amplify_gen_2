import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

String? listToString<T>(List<T> input) {
  if (input.isEmpty) return null;
  if (input is List<RoleStaff>) {
    return (input as List<RoleStaff>)
        .map((e) => e.role!.name)
        .toList()
        .join(', ');
  } else if (input is List<AircraftStaff>) {
    return (input as List<AircraftStaff>)
        .map((e) => e.aircraft!.name)
        .toList()
        .join(', ');
  } else if (input is List<StaffSubcategory>) {
    return (input as List<StaffSubcategory>)
        .map((e) => e.subcategory!.name)
        .toList()
        .join(', ');
  }
  return null;
}
