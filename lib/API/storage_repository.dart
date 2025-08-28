import 'package:adsats_amplify_gen_2/API/amplify_s3_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_repository.g.dart';

@Riverpod(keepAlive: true)
AmplifyS3API storageRepository(Ref ref) {
  return AmplifyS3API();
}
