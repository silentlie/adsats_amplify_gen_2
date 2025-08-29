import 'package:adsats_amplify_gen_2/helper/providers/query_providers.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_check.g.dart';

@Riverpod(dependencies: [userId, NoticeForm, listNoticeStaff])
FutureOr<List<NoticeStaff>> readCheck(Ref ref) async {
  final userId = ref.watch(userIdProvider).value!;
  final notice = ref.watch(
    noticeFormProvider.select(
      (value) => value.notice,
    ),
  );
  return await ref.watch(listNoticeStaffProvider(
    NoticeStaff.READAT
        .eq(null)
        .and(NoticeStaff.STAFF.eq(userId))
        .and(NoticeStaff.NOTICE.eq(notice.id)),
  ).future);
}
