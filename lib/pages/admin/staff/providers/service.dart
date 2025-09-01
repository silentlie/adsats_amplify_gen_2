import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:adsats_amplify_gen_2/pages/admin/staff/data/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service.g.dart';

@Riverpod(keepAlive: true)
StaffRepository staffService(Ref ref) {
  return StaffRepository(
    db: ref.read(databaseAPIProvider),
  );
}
