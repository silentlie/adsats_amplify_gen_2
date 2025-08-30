import 'package:adsats_amplify_gen_2/helper/extensions/iso_between.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

@freezed
sealed class NoticeFilterState with _$NoticeFilterState {
  NoticeFilterState._();
  factory NoticeFilterState(
      {required Staff user,
      @Default("") String search,
      NoticeType? type,
      NoticeStatus? status,
      bool? archived,
      DateTimeRange? noticedAt,
      DateTimeRange? deadlineAt}) = _NoticeFilterState;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = {};
    search.isNotEmpty ? result["subject"] = {"contains": search} : null;

    archived != null ? result["archived"] = {"eq": archived} : null;
    type != null ? result["type"] = {"eq": type!.name} : null;
    status != null ? result["type"] = {"eq": status!.name} : null;
    noticedAt != null
        ? result["noticedAt"] = {"between": noticedAt!.isoBetween}
        : null;
    deadlineAt != null
        ? result["deadlineAt"] = {"between": deadlineAt!.isoBetween}
        : null;
    return result;
  }
}
