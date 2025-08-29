import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/iso_between.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';
part 'filter.freezed.dart';

@Riverpod(dependencies: [userDetails])
class NoticeFilter extends _$NoticeFilter {
  @override
  NoticeFilterState build() {
    final user = ref.watch(userDetailsProvider.select(
      (value) {
        return value.value;
      },
    ));
    return NoticeFilterState(user: user!, archived: false);
  }

  void search(String name) {
    state = state.copyWith(search: name);
  }

  void apply(NoticeFilterState newState) {
    state = newState;
  }
}

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
