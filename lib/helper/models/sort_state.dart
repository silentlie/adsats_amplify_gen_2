import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_state.freezed.dart';

@freezed
sealed class SortState<T> with _$SortState<T> {
  const factory SortState({
    @Default(false) bool sortAscending,
    @Default(0) int sortColumnIndex,
    required Comparable? Function(T notice) getField,
    @Default(null) int Function(T a, T b, bool sortAscending)? custom,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _SortState;
}
