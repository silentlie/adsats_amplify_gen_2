import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

extension DocumentPath on Document {
  String get s3Path {
    return 'notices/$id/$name';
  }
}

extension NoticeDocumentPath on NoticeDocument {
  String s3Path(Notice notice) {
    return 'noticeDocuments/${notice.id}/$id/$name';
  }
}
