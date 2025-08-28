import 'package:adsats_amplify_gen_2/helper/models/sort_state.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';

@Riverpod()
class Sort<T extends Model> extends _$Sort<T> {
  @override
  SortState<T> build() {
    return SortState<T>(
      getField: (item) => switch (item) {
        Notice(:final noticedAt) => noticedAt,
        Report(:final reportedAt) => reportedAt,
        _ => null,
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
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
    );
  }
}
