import 'package:adsats_amplify_gen_2/helper/extensions/iso_between.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

@freezed
sealed class DocumentFilterState with _$DocumentFilterState {
  DocumentFilterState._();
  factory DocumentFilterState({
    required Subcategory subcategory,
    @Default("") String search,
    @Default(false) bool? archived,
    DateTimeRange? createdAt,
    DateTimeRange? issuedAt,
    DateTimeRange? expiredAt,
  }) = _DocumentFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    search.isNotEmpty ? result["name"] = {"contains": search} : null;
    archived != null ? result["archived"] = {"eq": archived} : null;
    createdAt != null
        ? result["createdAt"] = {"between": createdAt!.isoBetween}
        : null;
    issuedAt != null
        ? result["issuedAt"] = {"between": issuedAt!.isoBetween}
        : null;
    expiredAt != null
        ? result["expiredAt"] = {"between": expiredAt!.isoBetween}
        : null;
    result["subcategoryId"] = {"eq": subcategory.id};
    return result;
  }
}
