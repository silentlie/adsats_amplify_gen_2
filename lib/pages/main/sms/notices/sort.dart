import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';
part 'sort.freezed.dart';

@Riverpod()
class NoticeSort extends _$NoticeSort {
  @override
  NoticeSortState build() {
    return NoticeSortState(
      getField: (notice) {
        return notice.noticedAt ?? notice.createdAt!;
      },
    );
  }

  void rowsPerPage(int value) {
    state = state.copyWith(rowsPerPage: value);
  }

  void apply({
    required int columnIndex,
    required bool sortAscending,
    required Comparable? Function(Notice notice) getField,
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
    );
  }
}

@freezed
sealed class NoticeSortState with _$NoticeSortState {
  factory NoticeSortState({
    @Default(false) bool sortAscending,
    @Default(0) int sortColumnIndex,
    required Comparable? Function(Notice notice) getField,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _NoticeSortState;
}
