import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_check.g.dart';

@riverpod
FutureOr<List<NoticeStaff>> readCheck(Ref ref, Notice notice) async {
  final userId = ref.watch(userIdProvider).value!;
  final db = ref.read(databaseAPIProvider);
  return await db.listAll(
    modelType: NoticeStaff.classType,
    where: NoticeStaff.READAT
        .eq(null)
        .and(NoticeStaff.STAFF.eq(userId))
        .and(NoticeStaff.NOTICE.eq(notice.id)),
  );
}
