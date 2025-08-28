import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_repository.g.dart';

@Riverpod(keepAlive: true)
AmplifyAppSyncAPI databaseRepository(Ref ref) {
  return AmplifyAppSyncAPI();
}