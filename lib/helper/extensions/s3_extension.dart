import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

extension DocumentPath on Document {
  String get s3Path {
    return 'documents/$id/$name';
  }
}

extension NoticeDocumentPath on NoticeDocument {
  String s3Path(Notice notice) {
    return 'noticeDocuments/${notice.id}/$id/$name';
  }
}

extension FlightCrewRecordPath on FlightCrewRecord {
  String get s3Path {
    return 'flightCrewRecords/${staff!.id}/$id/$name';
  }
}

extension ReportDocumentPath on ReportDocument {
  String s3Path(Report report) {
    return 'reportDocuments/${report.id}/$id/$name';
  }
}
