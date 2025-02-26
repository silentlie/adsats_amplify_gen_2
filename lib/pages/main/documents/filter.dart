import 'package:adsats_amplify_gen_2/helper/between_date_range.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@Riverpod(dependencies: [])
class Filter extends _$Filter {
  @override
  FilterState build(Subcategory subcategory) {
    return FilterState(subcategory: subcategory, archived: false);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(FilterState newState) {
    state = newState;
  }
}

@freezed
class FilterState with _$FilterState {
  FilterState._();
  factory FilterState({
    required Subcategory subcategory,
    @Default("") String search,
    bool? archived,
    DateTimeRange? createdAt,
  }) = _FilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    search.isNotEmpty ? result["name"] = {"contains": search} : null;
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {"between": betweenDateRange(createdAt!)}
        : null;
    result["subcategoryId"] = {"eq": subcategory.id};
    return result;
  }
}
