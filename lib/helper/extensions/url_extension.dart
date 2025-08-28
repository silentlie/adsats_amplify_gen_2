import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

Uri _appLink(
  List<String> segments, {
  Map<String, String>? queryParameters,
}) {
  // from the running browser
  final b = Uri.base;
  return Uri(
    scheme: b.scheme,
    host: b.host,
    port: b.hasPort ? b.port : null,
    pathSegments: segments,
    queryParameters: queryParameters,
  );
}

extension NoticeUrl on Notice {
  Uri deepLink({
    Map<String, String>? query,
  }) =>
      _appLink(['sms', id], queryParameters: query);

  String get href => deepLink().toString();
}

extension ReportUrl on Report {
  Uri deepLink({
    Map<String, String>? query,
  }) =>
      _appLink(['cms', id], queryParameters: query);

  String get href => deepLink().toString();
}
