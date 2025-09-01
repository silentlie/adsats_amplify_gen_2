import 'package:adsats_amplify_gen_2/helper/extensions/iso_between.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

@freezed
sealed class StaffKPIFilterState with _$StaffKPIFilterState {
  StaffKPIFilterState._();
  factory StaffKPIFilterState({
    @Default("") String search,
    bool? archived,
    DateTimeRange? timeRange,
  }) = _StaffKPIFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variables = {};
    if (search.isNotEmpty) {
      variables["staffFilter"] = {
        "name": {"contains": search},
      };
    }
    if (archived != null) {
      variables.putIfAbsent("staffFilter", () => {})["archived"] = {
        "eq": archived,
      };
    }
    if (timeRange != null) {
      variables["noticeFilter"] = {
        "createdAt": {"between": timeRange!.isoBetween}
      };
      variables["reportFilter"] = {
        "createdAt": {"between": timeRange!.isoBetween}
      };
    }
    return variables;
  }
}
