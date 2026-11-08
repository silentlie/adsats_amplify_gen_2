/// Reads the selected safety officer ID from current and legacy notices.
///
/// Older notices could contain a serialized Staff or NoticeStaff object.
String? signatureStaffId(Object? signature) {
  if (signature is String) return signature;
  if (signature is Map) {
    final staff = signature['staff'];
    if (staff is Map && staff['id'] is String) {
      return staff['id'] as String;
    }
    final id = signature['id'];
    if (id is String) return id;
  }
  return null;
}
