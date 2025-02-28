import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';
part 'sort.freezed.dart';

int Function(Staff, Staff) compareStaff({
  required bool sortAscending,
  required Comparable Function(Staff staff) getField,
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
class StaffSort extends _$StaffSort {
  @override
  StaffSortState build() {
    return StaffSortState(
      getField: (staff) {
        return staff.createdAt!;
      },
    );
  }

  void rowsPerPage(int value) {
    state = state.copyWith(rowsPerPage: value);
  }

  void apply({
    required int columnIndex,
    required bool sortAscending,
    required Comparable Function(Staff staff) getField,
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
    );
  }
}

@freezed
class StaffSortState with _$StaffSortState {
  factory StaffSortState({
    @Default(false) bool sortAscending,
    @Default(5) int sortColumnIndex,
    required Comparable Function(Staff staff) getField,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _StaffSortState;
}
