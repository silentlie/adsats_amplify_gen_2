import 'package:adsats_amplify_gen_2/API/amplify_email_repository.dart';
import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_service.g.dart';

@Riverpod()
AmplifyEmailRepository emailService(Ref ref) {
  return AmplifyEmailRepository(ref.read(databaseAPIProvider));
}
