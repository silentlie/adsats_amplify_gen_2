import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

extension IterableJoinX<T> on Iterable<T> {
  /// Maps items to strings and joins them with [sep].
  /// Returns `null` if the resulting list is empty (configurable via [nullIfEmpty]).
  String? joinMapped(
    String? Function(T) pick, {
    String sep = ', ',
    bool nullIfEmpty = true,
  }) {
    final parts = map((e) => pick(e)?.trim())
        .where((s) => s != null && s.isNotEmpty)
        .cast<String>()
        .toList();

    if (parts.isEmpty) return nullIfEmpty ? null : '';
    return parts.join(sep);
  }
}

// Type-specific convenience extensions.
extension RoleStaffListX on Iterable<RoleStaff> {
  String? joinRoleNames({String sep = ', '}) =>
      joinMapped((e) => e.role?.name, sep: sep);
}

extension AircraftStaffListX on Iterable<AircraftStaff> {
  String? joinAircraftNames({String sep = ', '}) =>
      joinMapped((e) => e.aircraft?.name, sep: sep);
}

extension StaffSubcategoryListX on Iterable<StaffSubcategory> {
  String? joinSubcategoryNames({String sep = ', '}) =>
      joinMapped((e) => e.subcategory?.name, sep: sep);
}
