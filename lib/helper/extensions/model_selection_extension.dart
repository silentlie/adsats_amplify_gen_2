import 'package:amplify_flutter/amplify_flutter.dart';

bool sameSelection(Object? left, Object? right) {
  if (left is Model && right is Model) {
    return left.getInstanceType() == right.getInstanceType() &&
        left.modelIdentifier == right.modelIdentifier;
  }
  return left == right;
}

extension ModelSelectionExtension on Model {
  bool get isArchivedSelection => toMap()['archived'] == true;

  String get selectionLabel {
    final fields = toMap();
    final name = fields['name'];
    if (name is String) return name;
    final staffName = [fields['firstName'], fields['lastName']]
        .whereType<String>()
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .join(' ');
    return staffName.isNotEmpty
        ? staffName
        : modelIdentifier.serializeAsString();
  }
}
