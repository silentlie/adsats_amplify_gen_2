import 'dart:convert';

import 'package:adsats_amplify_gen_2/helper/serialization/form_details.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/providers/form.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/hazard_report/signature.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JSON form details', () {
    test('encodes nested primitives without changing their types', () {
      final input = {
        'reviewedAt': '2026-11-08T00:00:00.000Z',
        'isConfidential': false,
        'score': 2,
        'comments': ['first', null, {'ok': true}],
      };
      expect(jsonDecode(encodeFormDetails(input)), input);
    });

    test('rejects TemporalDateTime with an actionable field path', () {
      expect(
        () => encodeFormDetails({'reviewedAt': TemporalDateTime.now()}),
        throwsA(isA<FormatException>().having(
          (error) => error.message,
          'message',
          allOf(contains('details.reviewedAt'), contains('TemporalDateTime')),
        )),
      );
    });

    test('rejects a model stored directly in details', () {
      final officer = Staff(
        id: 'officer',
        firstName: 'Safety',
        lastName: 'Officer',
        email: 'officer@example.com',
        archived: false,
      );
      expect(
        () => encodeFormDetails({'signature': officer}),
        throwsA(isA<FormatException>().having(
          (error) => error.message,
          'message',
          allOf(contains('details.signature'), contains('Staff')),
        )),
      );
    });

    test('rejects keys that are not strings', () {
      expect(
        () => encodeFormDetails({'nested': {1: 'wrong'}}),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('hazard report signature compatibility', () {
    test('reads a saved staff ID', () {
      expect(signatureStaffId('officer-1'), 'officer-1');
    });

    test('reads an older serialized Staff', () {
      expect(signatureStaffId({'id': 'officer-1'}), 'officer-1');
    });

    test('reads an older serialized NoticeStaff', () {
      expect(
        signatureStaffId({
          'id': 'notice-staff-join',
          'staff': {'id': 'officer-1'},
        }),
        'officer-1',
      );
    });

    test('handles absent and malformed signatures', () {
      expect(signatureStaffId(null), isNull);
      expect(signatureStaffId({'staff': {}}), isNull);
    });
  });

  test('SMS Pending notice commits SRB date strings', () {
    final notice = Notice(
      subject: 'Hazard',
      type: NoticeType.Hazard_report,
      status: NoticeStatus.Open,
      archived: false,
      details: '{}',
    );
    final container = ProviderContainer(overrides: [
      noticeFormProvider.overrideWith(() => NoticeForm.withNotice(notice, false)),
    ]);
    addTearDown(container.dispose);

    final form = container.read(noticeFormProvider.notifier);
    form.switchStatus(NoticeStatus.Pending);
    form.updateDetails({
      'reviewedAt': TemporalDateTime.now().format(),
      'closedAt': TemporalDateTime.now().format(),
      'signature': 'officer-1',
    });
    form.commit();

    final state = container.read(noticeFormProvider);
    expect(state.notice.status, NoticeStatus.Pending);
    final saved = jsonDecode(state.notice.details) as Map<String, dynamic>;
    expect(saved['reviewedAt'], isA<String>());
    expect(saved['closedAt'], isA<String>());
    expect(saved['signature'], 'officer-1');
  });

  test('SMS notice rejects unsupported values before changing draft details', () {
    final notice = Notice(
      subject: 'Hazard',
      type: NoticeType.Hazard_report,
      status: NoticeStatus.Pending,
      archived: false,
      details: '{}',
    );
    final container = ProviderContainer(overrides: [
      noticeFormProvider.overrideWith(() => NoticeForm.withNotice(notice, false)),
    ]);
    addTearDown(container.dispose);

    final form = container.read(noticeFormProvider.notifier);
    expect(
      () => form.updateDetails({'reviewedAt': TemporalDateTime.now()}),
      throwsA(isA<FormatException>()),
    );
    form.commit();
    expect(jsonDecode(container.read(noticeFormProvider).notice.details), {});
  });

  test('CMS report details accept strings while rejecting TemporalDateTime', () {
    final report = Report(
      subject: 'Audit',
      type: ReportType.Internal_audit_report,
      status: ReportStatus.Open,
      archived: false,
      discrepanciesFound: false,
      details: '{}',
    );
    final container = ProviderContainer(overrides: [
      reportFormProvider.overrideWith(() => ReportForm.withReport(report, false)),
    ]);
    addTearDown(container.dispose);

    final form = container.read(reportFormProvider.notifier);
    form.updateDetails({'scope': 'Hangar'});
    expect(
      () => form.updateDetails({'closedAt': TemporalDateTime.now()}),
      throwsA(isA<FormatException>()),
    );
    form.commit();
    expect(jsonDecode(container.read(reportFormProvider).report.details),
        {'scope': 'Hangar'});
  });
}
