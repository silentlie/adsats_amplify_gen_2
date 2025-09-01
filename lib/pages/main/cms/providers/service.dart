import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/helper/providers/email_service.dart';
import 'package:adsats_amplify_gen_2/helper/providers/storage_api.dart';
import 'package:adsats_amplify_gen_2/pages/main/cms/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod(keepAlive: true)
ReportRepository reportService(Ref ref) {
  return ReportRepository(
    db: ref.watch(databaseAPIProvider),
    storage: ref.watch(storageAPIProvider),
    email: ref.watch(emailServiceProvider),
  );
}
