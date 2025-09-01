import 'package:adsats_amplify_gen_2/helper/models/sort_state.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/kpi/models/staff_kpi.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';

@Riverpod()
class Sort<T> extends _$Sort<T> {
  @override
  SortState<T> build() {
    return SortState<T>(
      getField: (item) => switch (item) {
        Notice(:final noticedAt) => noticedAt,
        Report(:final reportedAt) => reportedAt,
        Document(:final name) => name,
        FlightCrewRecord(:final name) => name,
        StaffKPI(:final noticeToCrews) => noticeToCrews,
        Aircraft(:final createdAt) => createdAt!,
        Staff(:final createdAt) => createdAt!,
        Session(:final updatedAt) => updatedAt!,
        Category(:final createdAt) => createdAt!,
        Subcategory(:final createdAt) => createdAt!,
        Role(:final createdAt) => createdAt!,
        FlightCrewRecordCategory(:final createdAt) => createdAt!,
        _ => null,
      },
      sortColumnIndex: switch (T) {
        const (Notice) => 5,
        const (Report) => 5,
        const (Document) => 0,
        const (FlightCrewRecord) => 0,
        const (StaffKPI) => 2,
        const (Aircraft) => 3,
        const (Staff) => 6,
        const (Session) => 2,
        const (Category) => 3,
        const (Subcategory) => 3,
        const (Role) => 3,
        const (FlightCrewRecordCategory) => 3,
        _ => 0,
      },
    );
  }

  void rowsPerPage(int value) {
    state = state.copyWith(rowsPerPage: value);
  }

  void apply({
    required int columnIndex,
    required bool sortAscending,
    required Comparable? Function(T item) getField,
    int Function(T a, T b, bool sortAscending)? custom,
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
      custom: custom,
    );
  }
}
