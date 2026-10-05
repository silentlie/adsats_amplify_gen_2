import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/widgets/basic_details_widget.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:adsats_amplify_gen_2/widgets/global_dropdown_menu.dart';
import 'package:adsats_amplify_gen_2/widgets/global_multi_select.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

Staff _staff(String id, {bool archived = false, String? email}) => Staff(
      id: id,
      firstName: id,
      lastName: 'Staff',
      email: email ?? '$id@example.com',
      archived: archived,
    );

typedef _LoadSelection = Future<List<Model>> Function(
  ProviderContainer container,
  QueryPredicate? where,
  bool includeArchived,
);

void main() {
  final cases =
      <({String name, Model active, Model archived, _LoadSelection load})>[
    (
      name: 'staff',
      active: _staff('active'),
      archived: _staff('archived', archived: true),
      load: (container, where, includeArchived) => container.read(
            listStaffProvider(where: where, includeArchived: includeArchived)
                .future,
          ),
    ),
    (
      name: 'aircraft',
      active: Aircraft(id: 'active', name: 'Active', archived: false),
      archived: Aircraft(id: 'archived', name: 'Archived', archived: true),
      load: (container, where, includeArchived) => container.read(
            listAircraftProvider(where: where, includeArchived: includeArchived)
                .future,
          ),
    ),
    (
      name: 'roles',
      active: Role(id: 'active', name: 'Active', archived: false),
      archived: Role(id: 'archived', name: 'Archived', archived: true),
      load: (container, where, includeArchived) => container.read(
            listRolesProvider(where: where, includeArchived: includeArchived)
                .future,
          ),
    ),
    (
      name: 'categories',
      active: Category(id: 'active', name: 'Active', archived: false),
      archived: Category(id: 'archived', name: 'Archived', archived: true),
      load: (container, where, includeArchived) => container.read(
            listCategoriesProvider(
                    where: where, includeArchived: includeArchived)
                .future,
          ),
    ),
    (
      name: 'subcategories',
      active: Subcategory(id: 'active', name: 'Active', archived: false),
      archived: Subcategory(id: 'archived', name: 'Archived', archived: true),
      load: (container, where, includeArchived) => container.read(
            listSubcategoriesProvider(
                    where: where, includeArchived: includeArchived)
                .future,
          ),
    ),
  ];

  for (final selection in cases) {
    group('${selection.name} selection queries', () {
      late _SelectionDatabase db;
      late ProviderContainer container;
      setUp(() {
        db = _SelectionDatabase([selection.active, selection.archived]);
        container = ProviderContainer(overrides: [
          databaseAPIProvider.overrideWithValue(db),
        ]);
      });
      tearDown(() => container.dispose());

      test('default selection returns active records only', () async {
        final result = await selection.load(container, null, false);
        expect(result, [selection.active]);
        expect(db.predicates.single, isNotNull);
      });

      test('history can explicitly include archived records', () async {
        expect(await selection.load(container, null, true),
            [selection.active, selection.archived]);
        expect(db.predicates.single, isNull);
      });

      test('caller predicates are combined with the archive exclusion',
          () async {
        final archivedOnly = QueryField(fieldName: 'archived').eq(true);
        expect(await selection.load(container, archivedOnly, false), isEmpty);
      });

      test('history retains caller predicates', () async {
        final archivedOnly = QueryField(fieldName: 'archived').eq(true);
        expect(await selection.load(container, archivedOnly, true),
            [selection.archived]);
        expect(db.predicates.single, same(archivedOnly));
      });
    });
  }

  testWidgets(
      'an archived dropdown value is preserved and cannot be newly selected',
      (tester) async {
    final active = _staff('Active');
    final archived = _staff('Former', archived: true);
    Staff? changed;
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: GlobalDropdownMenu<Staff>(
          entries: [
            DropdownMenuEntry(value: active, label: 'Active Staff'),
            DropdownMenuEntry(value: archived, label: 'Former Staff'),
          ],
          initialSelection: archived,
          onSelected: (staff) => changed = staff,
        ),
      ),
    ));
    final dropdown =
        tester.widget<DropdownMenu<Staff>>(find.byType(DropdownMenu<Staff>));
    expect(dropdown.initialSelection, same(archived));
    expect(dropdown.dropdownMenuEntries.last.label, 'Former Staff (Archived)');
    expect(dropdown.dropdownMenuEntries.last.enabled, isFalse);
    expect(changed, isNull);

    await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Active Staff').last);
    await tester.pumpAndSettle();
    expect(changed, same(active));
  });

  testWidgets('dropdown choices exclude unselected archived records',
      (tester) async {
    final active = _staff('Active');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: GlobalDropdownMenu<Staff>(
          entries: [
            DropdownMenuEntry(value: active, label: 'Active Staff'),
            DropdownMenuEntry(
                value: _staff('Former', archived: true), label: 'Former Staff'),
          ],
          onSelected: (_) {},
        ),
      ),
    ));
    final dropdown =
        tester.widget<DropdownMenu<Staff>>(find.byType(DropdownMenu<Staff>));
    expect(dropdown.dropdownMenuEntries.map((entry) => entry.value), [active]);
  });

  testWidgets('dropdown matches current records by id across model snapshots',
      (tester) async {
    final current = _staff('Active', email: 'current@example.com');
    final previous = _staff('Active', email: 'old@example.com');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: GlobalDropdownMenu<Staff>(
          entries: [DropdownMenuEntry(value: current, label: 'Active Staff')],
          initialSelection: previous,
          onSelected: (_) {},
        ),
      ),
    ));
    final dropdown =
        tester.widget<DropdownMenu<Staff>>(find.byType(DropdownMenu<Staff>));
    expect(dropdown.dropdownMenuEntries, hasLength(1));
    expect(dropdown.initialSelection, same(current));
  });

  testWidgets(
      'editing another selection preserves archived assignments and metadata',
      (tester) async {
    final previous = _staff('Active', email: 'old@example.com');
    final current = _staff('Active', email: 'current@example.com');
    final archived = _staff('Former', archived: true);
    final another = _staff('Another');
    List<Staff>? changed;
    await tester.pumpWidget(_multiSelect(
      items: [current, another],
      selected: [previous, archived],
      onChange: (value) => changed = value,
    ));
    await tester.tap(find.text('2 selected'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Another Staff').last);
    await tester.pumpAndSettle();

    expect(changed!.map((staff) => staff.id).toSet(),
        {'Active', 'Former', 'Another'});
    expect(
        changed!.where((staff) => staff.id == 'Active').single, same(previous));
    expect(
        changed!.where((staff) => staff.id == 'Former').single, same(archived));
  });

  testWidgets(
      'select all preserves existing archived assignments without adding new ones',
      (tester) async {
    final archived = _staff('Former', archived: true);
    List<Staff>? changed;
    await tester.pumpWidget(_multiSelect(
      items: [_staff('Active'), _staff('Unselected', archived: true)],
      selected: [archived],
      onChange: (value) => changed = value,
    ));
    await tester.tap(find.text('1 selected'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Select All'));
    await tester.pumpAndSettle();
    expect(changed!.map((staff) => staff.id).toSet(), {'Former', 'Active'});
  });

  testWidgets(
      'explicitly clearing assignments prevents archived references returning',
      (tester) async {
    List<Staff>? changed;
    await tester.pumpWidget(_multiSelect(
      items: [_staff('Active')],
      selected: [_staff('Former', archived: true)],
      onChange: (value) => changed = value,
    ));
    await tester.tap(find.text('1 selected'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Deselect All'));
    await tester.pumpAndSettle();
    expect(changed, isEmpty);
    await tester.tap(find.text('Active Staff').last);
    await tester.pumpAndSettle();
    expect(changed!.map((staff) => staff.id), ['Active']);
  });

  testWidgets('historical selection can choose an archived record',
      (tester) async {
    List<Staff>? changed;
    await tester.pumpWidget(_multiSelect(
      items: [_staff('Former', archived: true)],
      selected: const [],
      includeArchived: true,
      onChange: (value) => changed = value,
    ));
    await tester.tap(find.text('Tap to select'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Former Staff').last);
    await tester.pumpAndSettle();
    expect(changed!.map((staff) => staff.id), ['Former']);
  });

  testWidgets('an old notice with an archived author still opens',
      (tester) async {
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final author = _staff('Former', archived: true);
    final notice = Notice(
      id: 'notice',
      subject: 'Historical notice',
      type: NoticeType.Safety_notice,
      status: NoticeStatus.Open,
      archived: false,
      details: '{}',
      author: author,
    );
    await tester.pumpWidget(ProviderScope(
      overrides: [
        isSafetyOfficerProvider.overrideWithValue(false),
        listStaffProvider().overrideWith((ref) async => [_staff('Active')]),
        noticeFormProvider
            .overrideWith(() => NoticeForm.withNotice(notice, false)),
      ],
      child:
          const MaterialApp(home: Scaffold(body: NoticeBasicDetailsWidget())),
    ));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    final authorDropdown =
        tester.widget<DropdownMenu<Staff>>(find.byType(DropdownMenu<Staff>));
    expect(authorDropdown.initialSelection, same(author));
    expect(authorDropdown.dropdownMenuEntries.last.label,
        'Former Staff (Archived)');
  });
}

Widget _multiSelect({
  required List<Staff> items,
  required List<Staff> selected,
  required void Function(List<Staff>) onChange,
  bool includeArchived = false,
}) =>
    MaterialApp(
      home: Scaffold(
        body: MultiSelectFormField<Staff>(
          title: 'Staff',
          items: items,
          initialValue: selected,
          includeArchived: includeArchived,
          onChange: onChange,
          toCard: (staff) => CheckListCard(
              value: staff, title: Text('${staff.firstName} Staff')),
        ),
      ),
    );

class _SelectionDatabase extends AmplifyAppSyncAPI {
  _SelectionDatabase(this.items);

  final List<Model> items;
  final predicates = <QueryPredicate?>[];

  @override
  Future<List<T>> listAll<T extends Model>({
    required ModelType<T> modelType,
    QueryPredicate? where,
    int limit = 10000,
    void Function(void Function())? bindCancel,
  }) async {
    predicates.add(where);
    return items
        .whereType<T>()
        .where((item) => where?.evaluate(item) ?? true)
        .toList();
  }
}
