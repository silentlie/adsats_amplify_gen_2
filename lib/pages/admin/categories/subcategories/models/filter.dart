import 'package:adsats_amplify_gen_2/helper/extensions/iso_between.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

@freezed
sealed class SubcategoryFilterState with _$SubcategoryFilterState {
  SubcategoryFilterState._();
  factory SubcategoryFilterState({
    @Default("") String search,
    @Default(false) bool? archived,
    DateTimeRange? createdAt,
    required String categoryId,
  }) = _SubcategoryFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    search.isNotEmpty ? result["name"] = {"contains": search} : null;
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {"between": createdAt!.isoBetween}
        : null;
    return result;
  }
}
