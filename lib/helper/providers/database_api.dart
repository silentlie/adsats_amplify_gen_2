import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_api.g.dart';

@Riverpod(keepAlive: true)
AmplifyAppSyncAPI databaseAPI(Ref ref) {
  return AmplifyAppSyncAPI();
}
