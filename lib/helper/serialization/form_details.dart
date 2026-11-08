import 'dart:convert';

/// Encodes form details, refusing unsupported Dart objects rather than
/// implicitly calling a model's toJson() method.
String encodeFormDetails(Map<String, dynamic> details) {
  _ensureJsonSafe(details, 'details');
  return jsonEncode(details);
}

void _ensureJsonSafe(Object? value, String path) {
  if (value == null || value is String || value is bool) return;
  if (value is num && value.isFinite) return;

  if (value is Map) {
    for (final entry in value.entries) {
      if (entry.key is! String) {
        throw FormatException('Invalid JSON key at $path: keys must be strings.');
      }
      _ensureJsonSafe(entry.value, '$path.${entry.key}');
    }
    return;
  }

  if (value is List) {
    for (var i = 0; i < value.length; i++) {
      _ensureJsonSafe(value[i], '$path[$i]');
    }
    return;
  }

  throw FormatException(
    'Unsupported ${value.runtimeType} at $path. '
    'Store dates as formatted strings and selected models as IDs.',
  );
}
