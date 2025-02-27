import 'package:adsats_amplify_gen_2/helper/between_date_range.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@Riverpod(dependencies: [])
class DocumentFilter extends _$DocumentFilter {
  @override
  DocumentFilterState build(Subcategory subcategory) {
    return DocumentFilterState(subcategory: subcategory);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(DocumentFilterState newState) {
    state = newState;
  }
}

@freezed
class DocumentFilterState with _$DocumentFilterState {
  DocumentFilterState._();
  factory DocumentFilterState({
    required Subcategory subcategory,
    @Default("") String search,
    @Default(false)
    bool? archived,
    DateTimeRange? createdAt,
  }) = _DocumentFilterState;

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
