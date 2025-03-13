import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sort.g.dart';
part 'sort.freezed.dart';

int Function(Subcategory, Subcategory) compareSubcategory({
  required bool sortAscending,
  required Comparable Function(Subcategory subcategory) getField,
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
class SubcategorySort extends _$SubcategorySort {
  @override
  SubcategorySortState build() {
    return SubcategorySortState(
      getField: (subcategory) {
        return subcategory.createdAt!;
      },
    );
  }

  void rowsPerPage(int value) {
    state = state.copyWith(rowsPerPage: value);
  }

  void apply({
    required int columnIndex,
    required bool sortAscending,
    required Comparable Function(Subcategory subcategory) getField,
  }) {
    state = state.copyWith(
      sortColumnIndex: columnIndex,
      sortAscending: sortAscending,
      getField: getField,
    );
  }
}

@freezed
sealed class SubcategorySortState with _$SubcategorySortState {
  factory SubcategorySortState({
    @Default(false) bool sortAscending,
    @Default(3) int sortColumnIndex,
    required Comparable Function(Subcategory subcategory) getField,
    @Default(PaginatedDataTable.defaultRowsPerPage) int rowsPerPage,
  }) = _SubcategorySortState;
}
