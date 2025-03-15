import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';
part 'sort.freezed.dart';

int Function(CrewDocumentCategory, CrewDocumentCategory)
    compareCrewDocumentCategory({
  required bool sortAscending,
  required Comparable Function(CrewDocumentCategory crewDocumentCategory)
      getField,
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
class CrewDocumentCategorySort extends _$CrewDocumentCategorySort {
  @override
  CrewDocumentCategorySortState build() {
    return CrewDocumentCategorySortState(
      getField: (crewDocumentCategory) {
        return crewDocumentCategory.createdAt!;
      },
    );
  }

  void rowsPerPage(int value) {
    state = state.copyWith(rowsPerPage: value);
  }

  void apply({
    required int columnIndex,
    required bool sortAscending,
    required Comparable Function(CrewDocumentCategory crewDocumentCategory)
        getField,
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
    );
  }
}

@freezed
sealed class CrewDocumentCategorySortState
    with _$CrewDocumentCategorySortState {
  factory CrewDocumentCategorySortState({
    @Default(false) bool sortAscending,
    @Default(3) int sortColumnIndex,
    required Comparable Function(CrewDocumentCategory crewDocumentCategory)
        getField,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _CrewDocumentCategorySortState;
}
