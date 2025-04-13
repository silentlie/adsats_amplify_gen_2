import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';
part 'sort.freezed.dart';

int Function(Session, Session) compareSession({
  required bool sortAscending,
  required Comparable Function(Session session) getField,
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
class SessionSort extends _$SessionSort {
  @override
  SessionSortState build() {
    return SessionSortState(
      getField: (session) {
        return session.createdAt!;
      },
    );
  }

  void rowsPerPage(int value) {
    state = state.copyWith(rowsPerPage: value);
  }

  void apply({
    required int columnIndex,
    required bool sortAscending,
    required Comparable Function(Session session) getField,
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
    );
  }
}

@freezed
sealed class SessionSortState with _$SessionSortState {
  factory SessionSortState({
    @Default(false) bool sortAscending,
    @Default(0) int sortColumnIndex,
    required Comparable Function(Session session) getField,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _SessionSortState;
}
