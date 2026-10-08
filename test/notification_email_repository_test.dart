import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/amplify_notification_email_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final isNotice in [true, false]) {
    final kind = isNotice ? 'notice' : 'report';

    Future<Map<String, dynamic>> send(_FakeAPI api) {
      final repository = AmplifyNotificationEmailRepository(api);
      return isNotice
          ? repository.sendNoticeEmail(id: kind)
          : repository.sendReportEmail(id: kind);
    }

    group('$kind email delivery', () {
      for (final encodeResult in [true, false]) {
        test('accepts complete success (encoded: $encodeResult)', () async {
          final results = [
            {'recipient': 'active@example.com', 'ok': true},
          ];
          final api = _FakeAPI({
            'sendNotificationEmail':
                encodeResult ? jsonEncode(results) : results,
          });

          expect(await send(api), api.response);
          expect(api.variables, {
            'id': kind,
            'isNotice': isNotice,
            'isReport': !isNotice,
            'host': Uri.base.toString(),
          });
        });
      }

      test('reports partial failure and preserves the failed recipient',
          () async {
        final api = _FakeAPI({
          'sendNotificationEmail': jsonEncode([
            {'recipient': 'sent@example.com', 'ok': true},
            {
              'recipient': 'failed@example.com',
              'ok': false,
              'error': 'MessageRejected: Recipient is not verified',
            },
          ]),
        });

        await expectLater(
          send(api),
          throwsA(isA<Exception>().having(
            (error) => error.toString(),
            'delivery outcome',
            allOf(
              contains('saved'),
              contains('1 of 2'),
              contains('failed@example.com'),
              contains('MessageRejected'),
            ),
          )),
        );
      });

      test('reports all failures with the SES error', () async {
        final api = _FakeAPI({
          'sendNotificationEmail': [
            {
              'recipient': 'failed@example.com',
              'ok': false,
              'error': 'AccessDeniedException: ses:SendEmail is not authorized',
            },
          ],
        });

        await expectLater(
          send(api),
          throwsA(isA<Exception>().having(
            (error) => error.toString(),
            'delivery outcome',
            allOf(contains('0 of 1'), contains('AccessDeniedException')),
          )),
        );
      });

      test('does not report success when no email was sent', () async {
        final api = _FakeAPI({'sendNotificationEmail': '[]'});

        await expectLater(
          send(api),
          throwsA(isA<Exception>().having(
            (error) => error.toString(),
            'delivery outcome',
            allOf(contains('saved'), contains('no email')),
          )),
        );
      });

      for (final result in [
        null,
        'invalid JSON',
        {},
        [null],
        [
          {'recipient': 'active@example.com'}
        ],
        [
          {'recipient': 'active@example.com', 'ok': 'true'}
        ],
      ]) {
        test('rejects an unconfirmed delivery result: $result', () async {
          final api = _FakeAPI({'sendNotificationEmail': result});

          await expectLater(
            send(api),
            throwsA(isA<Exception>().having(
              (error) => error.toString(),
              'delivery outcome',
              allOf(contains('saved'), contains('could not be confirmed')),
            )),
          );
        });
      }

      test('preserves an API error and explains that the record was saved',
          () async {
        final api = _FakeAPI({}, error: Exception('Lambda timed out'));

        await expectLater(
          send(api),
          throwsA(isA<Exception>().having(
            (error) => error.toString(),
            'delivery outcome',
            allOf(contains('saved'), contains('Lambda timed out')),
          )),
        );
      });

      test('displays the Lambda error without the full GraphQL payload',
          () async {
        final api = _FakeAPI({},
            error: const GraphQLResponseError(
              message: 'No credentials',
              errorType: 'Lambda:Unhandled',
              path: ['sendNotificationEmail'],
            ));

        await expectLater(
          send(api),
          throwsA(isA<NotificationEmailException>().having(
            (error) => error.message,
            'message',
            'The $kind was saved, but email delivery could not be confirmed. No credentials',
          )),
        );
      });
    });
  }
}

class _FakeAPI extends AmplifyAppSyncAPI {
  _FakeAPI(this.response, {this.error});

  final Map<String, dynamic> response;
  final Object? error;
  Map<String, dynamic>? variables;

  @override
  Future<Map<String, dynamic>> mutate({
    required String document,
    required Map<String, dynamic> variables,
  }) async {
    this.variables = variables;
    if (error != null) throw error!;
    return response;
  }
}
