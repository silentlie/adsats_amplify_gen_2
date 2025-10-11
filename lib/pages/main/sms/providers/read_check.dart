import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_check.g.dart';

@Riverpod(dependencies: [NoticeForm])
FutureOr<List<NoticeStaff>> readCheck(Ref ref) async {
  final userId = ref.watch(userIdProvider).value!;
  final notice = ref.watch(
    noticeFormProvider.select(
      (value) => value.notice,
    ),
  );
  final db = ref.read(databaseAPIProvider);
  return await db.listAll(
    modelType: NoticeStaff.classType,
    where: NoticeStaff.READAT
        .eq(null)
        .and(NoticeStaff.STAFF.eq(userId))
        .and(NoticeStaff.NOTICE.eq(notice.id)),
  );
}
