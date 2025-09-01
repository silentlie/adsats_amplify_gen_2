import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/models/filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter.g.dart';

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
