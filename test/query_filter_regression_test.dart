import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/reports/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/models/filter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  final range = DateTimeRange(
      start: DateTime.utc(2026, 10, 1), end: DateTime.utc(2026, 10, 5));
  final bounds = ['2026-10-01T00:00:00.000Z', '2026-10-05T00:00:00.000Z'];
  final user = Staff(
      firstName: 'Test',
      lastName: 'Staff',
      email: 'test@example.com',
      archived: false);

  test(
      'KPI staff search uses valid name and email fields while retaining archive and metric dates',
      () {
    final variables =
        StaffKPIFilterState(search: 'test', archived: false, timeRange: range)
            .toJson();
    final filter = variables['staffFilter'] as Map<String, dynamic>;

    expect(filter['or'], [
      {
        'firstName': {'contains': 'test'}
      },
      {
        'lastName': {'contains': 'test'}
      },
      {
        'email': {'contains': 'test'}
      },
    ]);
    for (final condition in filter['or'] as List) {
      for (final field in (condition as Map).keys) {
        expect(Staff.schema.fields!.containsKey(field), isTrue);
      }
    }
    expect(filter.containsKey('name'), isFalse);
    expect(filter['archived'], {'eq': false});
    expect(variables['noticeFilter'], {
      'createdAt': {'between': bounds}
    });
    expect(variables['reportFilter'], {
      'createdAt': {'between': bounds}
    });
  });

  test(
      'clearing KPI search preserves the archive filter without an empty search predicate',
      () {
    expect(StaffKPIFilterState(archived: false).toJson(), {
      'staffFilter': {
        'archived': {'eq': false}
      },
    });
    expect(StaffKPIFilterState().toJson(), isEmpty);
  });

  test('CMS report date uses reportedAt alongside the other report filters',
      () {
    final filter = ReportFilterState(
      user: user,
      search: 'inspection',
      archived: false,
      type: ReportType.values.first,
      status: ReportStatus.values.first,
      discrepanciesFound: true,
      reportedAt: range,
    ).toJson();

    expect(filter['reportedAt'], {'between': bounds});
    expect(filter.containsKey('createdAt'), isFalse);
    expect(filter['subject'], {'contains': 'inspection'});
    expect(filter['archived'], {'eq': false});
    expect(filter['type'], {'eq': ReportType.values.first.name});
    expect(filter['status'], {'eq': ReportStatus.values.first.name});
    expect(filter['discrepanciesFound'], {'eq': true});
  });

  test('clearing CMS report date removes only the date condition', () {
    expect(ReportFilterState(user: user, archived: false).toJson(), {
      'archived': {'eq': false},
    });
  });
}
