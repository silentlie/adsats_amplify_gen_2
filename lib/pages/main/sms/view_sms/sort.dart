import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';
part 'sort.freezed.dart';

int Function(Notice, Notice) compareNotices({
  required bool sortAscending,
  required Comparable Function(Notice notice) getField,
}) {
  return (a, b) {
    final aValue = getField(a);
    final bValue = getField(b);
    return sortAscending
        ? Comparable.compare(aValue, bValue)
        : Comparable.compare(bValue, aValue);
  };
}

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
    required Comparable Function(Notice notice) getField,
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
    );
  }
}

@freezed
class NoticeSortState with _$NoticeSortState {
  factory NoticeSortState({
    @Default(false) bool sortAscending,
    @Default(3) int sortColumnIndex,
    required Comparable Function(Notice notice) getField,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _NoticeSortState;
}
