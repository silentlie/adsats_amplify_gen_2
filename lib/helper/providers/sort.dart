import 'package:adsats_amplify_gen_2/helper/models/sort_state.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';

@Riverpod(dependencies: [])
class Sort<T> extends _$Sort<T> {
  @override
  SortState<T> build() {
    return SortState<T>(
      getField: (item) => switch (item) {
        Notice(:final noticedAt) => noticedAt,
        Report(:final reportedAt) => reportedAt,
        Document(:final name) => name,
        _ => null,
      },
      sortColumnIndex: switch (T) {
        const (Notice) => 5,
        const (Report) => 5,
        const (Document) => 0,
        _ => -1,
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
    // TODO: need to confirm if custom actual reset
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
      custom: custom,
    );
    print(state);
  }
}
