import 'dart:convert';

import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

extension NoticeDetailsExtension on Notice {
  /// Safely parse and return the `details` JSON as a Map.
  /// Returns an empty map if `details` is null/empty or parsing fails.
  Map<String, dynamic> get detailsMap {
    try {
      if (details.isEmpty) return <String, dynamic>{};
      final parsed = jsonDecode(details) as Map<String, dynamic>;
      return parsed;
    } catch (_) {
      return <String, dynamic>{};
    }
  }

  /// Alias for `detailsMap` for clarity in call sites.
  Map<String, dynamic> getDetails() => detailsMap;

  /// Convenience getters for common detail fields.
  /// Return `null` when this notice is not a `Hazard_report`.
  /// When the notice `status` is `Resolved` the reviewed fields are used
  /// if present; otherwise fall back to the original values.
  int? get likelihood {
    if (type != NoticeType.Hazard_report) return null;
    if (status == NoticeStatus.Resolved) {
      return (detailsMap['reviewed_likelihood'] as int?) ??
          (detailsMap['likelihood'] as int?) ??
          0;
    }
    return (detailsMap['likelihood'] as int?) ?? 0;
  }

  int? get severity {
    if (type != NoticeType.Hazard_report) return null;
    if (status == NoticeStatus.Resolved) {
      return (detailsMap['reviewed_severity'] as int?) ??
          (detailsMap['severity'] as int?) ??
          0;
    }
    return (detailsMap['severity'] as int?) ?? 0;
  }

  /// Combined risk = likelihood + severity. Returns null if not a Hazard_report.
  int? get risk {
    if (type != NoticeType.Hazard_report) return null;
    final l = likelihood!;
    final s = severity!;
    return l + s;
  }
}
