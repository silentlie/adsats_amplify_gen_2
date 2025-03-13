import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';
part 'sort.freezed.dart';

int Function(Aircraft, Aircraft) compareAircraft({
  required bool sortAscending,
  required Comparable Function(Aircraft aircraft) getField,
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
class AircraftSort extends _$AircraftSort {
  @override
  AircraftSortState build() {
    return AircraftSortState(
      getField: (aircraft) {
        return aircraft.createdAt!;
      },
    );
  }

  void rowsPerPage(int value) {
    state = state.copyWith(rowsPerPage: value);
  }

  void apply({
    required int columnIndex,
    required bool sortAscending,
    required Comparable Function(Aircraft aircraft) getField,
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
    );
  }
}

@freezed
sealed class AircraftSortState with _$AircraftSortState {
  factory AircraftSortState({
    @Default(false) bool sortAscending,
    @Default(3) int sortColumnIndex,
    required Comparable Function(Aircraft aircraft) getField,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _AircraftSortState;
}
