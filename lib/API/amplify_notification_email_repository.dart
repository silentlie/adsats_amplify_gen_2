import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/mutations.dart';

class AmplifyNotificationEmailRepository {
  final AmplifyAppSyncAPI _api;

  const AmplifyNotificationEmailRepository(this._api);

  Future<Map<String, dynamic>> sendNoticeEmail({
    required String id,
  }) {
    return _api.mutate(
      document: sendNotificationEmailDocument,
      variables: {
        'id': id,
        'isNotice': true,
        'isReport': false,
        'host': Uri.base.toString(),
      },
    );
  }

  Future<Map<String, dynamic>> sendReportEmail({
    required String id,
  }) {
    return _api.mutate(
      document: sendNotificationEmailDocument,
      variables: {
        'id': id,
        'isNotice': false,
        'isReport': true,
        'host': Uri.base.toString(),
      },
    );
  }
}
