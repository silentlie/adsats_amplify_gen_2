import 'dart:convert';

import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/notice_api.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/notice/s3.dart';
import 'package:adsats_amplify_gen_2/route/sms_route/sms_widget.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NoticeNotifier extends ChangeNotifier {
  final BuildContext context;
  final formKey = GlobalKey<FormState>();
  Notice? notice;
  late final String id;
  late bool editMode;
  late NoticeType type;
  late NoticeStatus status;
  late bool archived;
  late Staff author;
  late String subject;
  TemporalDateTime? noticedAt;
  TemporalDateTime? deadlineAt;
  late final Map<String, dynamic> details;
  late List<NoticeDocument> documents;
  List<NoticeDocument> documentsToDelete = [];
  late List<Aircraft> aircraft;
  List<Role> roles = [];
  late List<Staff> recipients;
  List<PlatformFile> selectedFiles = [];
  void Function(VoidCallback) setState = (f) {
    throw UnimplementedError();
  };

  NoticeNotifier.noticeToCrew({
    this.notice,
    required this.context,
  }) {
    type = notice?.type ?? NoticeType.Notice_to_Crew;
    _loadNotice();
  }

  NoticeNotifier.safetyNotice({
    this.notice,
    required this.context,
  }) {
    type = notice?.type ?? NoticeType.Safety_notice;
    _loadNotice();
  }

  NoticeNotifier.hazardReport({
    this.notice,
    required this.context,
  }) {
    type = notice?.type ?? NoticeType.Hazard_report;
    _loadNotice();
  }

  void _loadNotice() {
    editMode = notice == null;
    id = notice?.id ?? "";
    status = notice?.status ?? NoticeStatus.Draft;
    archived = notice?.archived ?? false;
    author = notice?.author ??
        Provider.of<AuthNotifier>(context, listen: false).user;
    subject = notice?.subject ?? "";
    noticedAt = notice?.noticed_at;
    deadlineAt = notice?.deadline_at;
    details = json.decode(notice?.details ?? "{}") as Map<String, dynamic>;
    documents = notice?.documents ?? [];
    aircraft = notice?.aircraft?.map((e) => e.aircraft!).toList() ?? [];
    recipients = notice?.recipients?.map((e) => e.staff!).toList() ?? [];
  }

  Future<void> saveNotice(bool sendNotice) async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    final newNotice = Notice(
      id: notice?.id,
      type: type,
      status: status,
      author: author,
      noticed_at: noticedAt,
      deadline_at: deadlineAt,
      subject: subject,
      archived: archived,
      details: jsonEncode(details),
    );
    if (notice == null) {
      await Future.wait([
        create(newNotice),
        ...aircraft.map(
          (e) {
            return create(AircraftNotice(aircraft: e, notice: newNotice));
          },
        ),
        ...selectedFiles.map(
          (file) {
            return uploadFile(file, newNotice);
          },
        ),
      ]);
    } else {
      await Future.wait([
        update(newNotice),
        updateAircraftNotice(newNotice, aircraft),
        ...documentsToDelete.map(
          (e) {
            return delete(e);
          },
        ),
        ...selectedFiles.map(
          (file) {
            return uploadFile(file, newNotice);
          },
        ),
        ...documentsToDelete.map(
          (document) {
            return deleteFile(document, newNotice);
          },
        )
      ]);
    }
    if (sendNotice) {
      final finalRecipients = await fetchJoinRecipients();
      await Future.wait(
        finalRecipients.map(
          (e) {
            return create(NoticeStaff(staff: e, notice: newNotice));
          },
        ),
      );
    }
    if (!context.mounted) return;
    context.go(SMSWidget.path);
  }

  Future<Iterable<Staff>> fetchJoinRecipients() async {
    Map<String, dynamic> aircraftFilter = {
      "or": aircraft
          .map(
            (aircraft) => {
              "aircraftId": {"eq": aircraft.id}
            },
          )
          .toList()
    };
    Map<String, dynamic> rolesFilter = {
      "or": roles
          .map(
            (role) => {
              "roleId": {"eq": role.id}
            },
          )
          .toList()
    };
    try {
      final request =
          GraphQLRequest<String>(document: listJoinRecipients, variables: {
        "aircraft": aircraftFilter,
        "rolesFilter": rolesFilter,
      });
      final response = await Amplify.API.query(request: request).response;
      if (response.errors.isNotEmpty) {
        throw response.errors.first;
      }
      Map<String, dynamic> jsonMap = json.decode(response.data!);
      final staff = (jsonMap["listStaff"]["items"] as List)
          .map((e) => Staff.fromJson(e))
          .where(
            (element) =>
                (element.aircraft?.isNotEmpty ?? false) &&
                (element.roles?.isNotEmpty ?? false),
          );
      recipients.addAll(staff);
      return recipients.fold<Map<String, Staff>>({}, (map, staff) {
        map.putIfAbsent(staff.id, () => staff);
        return map;
      }).values;
    } on ApiException catch (e) {
      debugPrint('ApiExecption: fetchJoinRecipients failed: $e');
      rethrow;
    } on Exception catch (e) {
      debugPrint('Dart Exception: fetchJoinRecipients failed: $e');
      rethrow;
    }
  }

  void removeDocument(NoticeDocument document) {
    documents.remove(document);
    documentsToDelete.add(document);
    notifyListeners();
  }

  void addFiles(List<PlatformFile> files) {
    selectedFiles.addAll(files);
    notifyListeners();
  }

  void removeFile(PlatformFile file) {
    selectedFiles.remove(file);
    notifyListeners();
  }
}
