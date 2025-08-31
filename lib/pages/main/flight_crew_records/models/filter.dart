import 'package:adsats_amplify_gen_2/helper/extensions/iso_between.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

@freezed
sealed class FlightCrewRecordFilterState with _$FlightCrewRecordFilterState {
  FlightCrewRecordFilterState._();
  factory FlightCrewRecordFilterState({
    required final Staff staff,
    required final FlightCrewRecordCategory category,
    @Default("") String search,
    @Default(false) bool? archived,
    DateTimeRange? createdAt,
    DateTimeRange? issuedAt,
    DateTimeRange? expiredAt,
  }) = _FlightCrewRecordFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {
      "staffId": {"eq": staff.id},
      "categoryId": {"eq": category.id},
    };
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
    return result;
  }
}
