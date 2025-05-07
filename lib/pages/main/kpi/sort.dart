import 'package:adsats_amplify_gen_2/pages/main/kpi/repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';
part 'sort.freezed.dart';

int Function(StaffKPI, StaffKPI) compareStaffKPI({
  required bool sortAscending,
  required Comparable Function(StaffKPI staffKPI) getField,
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
class StaffKPISort extends _$StaffKPISort {
  @override
  StaffKPISortState build() {
    return StaffKPISortState(
      getField: (staffKPI) {
        return staffKPI.noticeToCrews;
      },
    );
  }

  void rowsPerPage(int value) {
    state = state.copyWith(rowsPerPage: value);
  }

  void apply({
    required int columnIndex,
    required bool sortAscending,
    required Comparable Function(StaffKPI staffKPI) getField,
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
    );
  }
}

@freezed
sealed class StaffKPISortState with _$StaffKPISortState {
  factory StaffKPISortState({
    @Default(false) bool sortAscending,
    @Default(0) int sortColumnIndex,
    required Comparable Function(StaffKPI staffKPI) getField,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _StaffKPISortState;
}
