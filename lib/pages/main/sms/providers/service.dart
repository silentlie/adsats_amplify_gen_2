import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/helper/providers/email_service.dart';
import 'package:adsats_amplify_gen_2/helper/providers/storage_api.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod(dependencies: [], keepAlive: true)
NoticeRepository noticeService(Ref ref) {
  return NoticeRepository(
    db: ref.read(databaseAPIProvider),
    storage: ref.read(storageAPIProvider),
    email: ref.read(emailServiceProvider),
  );
}
