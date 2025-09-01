import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/helper/providers/storage_api.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod(keepAlive: true)
DocumentsRepository documentsService(Ref ref) {
  return DocumentsRepository(
    db: ref.read(databaseAPIProvider),
    storage: ref.read(storageAPIProvider),
  );
}
