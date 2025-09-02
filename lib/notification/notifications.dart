import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications.g.dart';

@Riverpod(dependencies: [userDetails])
List<NoticeStaff> notifications(Ref ref) {
  // warning: list return a new instance which will cause rebuild even everything is the same
  return ref.watch(userDetailsProvider.select(
    (user) {
      return user.value?.notifications ?? [];
    },
  ));
}
