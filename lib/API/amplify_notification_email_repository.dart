import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AmplifyNotificationEmailRepository {
  final AmplifyAppSyncAPI _api;

  const AmplifyNotificationEmailRepository(this._api);

  Future<Map<String, dynamic>> sendNoticeEmail({
    required String id,
  }) {
    return _send(id: id, isNotice: true);
  }

  Future<Map<String, dynamic>> sendReportEmail({
    required String id,
  }) {
    return _send(id: id, isNotice: false);
  }

  Future<Map<String, dynamic>> _send({
    required String id,
    required bool isNotice,
  }) async {
    final kind = isNotice ? 'notice' : 'report';
    final savedMessage = 'The $kind was saved, but';
    final unconfirmedMessage =
        '$savedMessage email delivery could not be confirmed.';
    final Map<String, dynamic> response;
    try {
      response = await _api.mutate(
        document: sendNotificationEmailDocument,
        variables: {
          'id': id,
          'isNotice': isNotice,
          'isReport': !isNotice,
          'host': Uri.base.toString(),
        },
      );
    } catch (error) {
      final detail =
          error is GraphQLResponseError ? error.message : error.toString();
      throw NotificationEmailException('$unconfirmedMessage $detail');
    }

    dynamic results = response['sendNotificationEmail'];
    if (results is String) {
      try {
        results = jsonDecode(results);
      } on FormatException {
        throw NotificationEmailException(unconfirmedMessage);
      }
    }
    if (results is! List ||
        results.any((result) =>
            result is! Map ||
            result['recipient'] is! String ||
            result['ok'] is! bool)) {
      throw NotificationEmailException(unconfirmedMessage);
    }
    if (results.isEmpty) {
      throw NotificationEmailException(
        '$savedMessage no email was sent. Check that the record and its recipients are active.',
      );
    }

    final failures = results.where((result) => result['ok'] == false).toList();
    if (failures.isNotEmpty) {
      final sentCount = results.length - failures.length;
      final details = failures.map((result) {
        final error = result['error'];
        final detail = error is String && error.isNotEmpty ? ': $error' : '';
        return '${result['recipient']}$detail';
      }).join('; ');
      throw NotificationEmailException(
        '$savedMessage email was sent to $sentCount of ${results.length} recipients. '
        'Failed recipients: $details',
      );
    }
    return response;
  }
}

class NotificationEmailException implements Exception {
  const NotificationEmailException(this.message);

  final String message;

  @override
  String toString() => message;
}
