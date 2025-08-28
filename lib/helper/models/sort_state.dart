import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_state.freezed.dart';

@freezed
sealed class SortState<T extends Model> with _$SortState<T> {
  factory SortState({
    @Default(false) bool sortAscending,
    @Default(0) int sortColumnIndex,
    required Comparable? Function(T notice) getField,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _SortState;
}
