/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';

/** This is an auto generated class representing the Report type in your schema. */
class Report extends amplify_core.Model {
  static const classType = const _ReportModelType();
  final String id;
  final String? _subject;
  final ReportType? _type;
  final ReportStatus? _status;
  final bool? _archived;
  final String? _details;
  final Staff? _auditor;
  final amplify_core.TemporalDateTime? _reportedAt;
  final bool? _discrepanciesFound;
  final Staff? _closer;
  final amplify_core.TemporalDateTime? _closeAt;
  final List<ReportStaff>? _recipients;
  final List<ReportDocument>? _documents;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  ReportModelIdentifier get modelIdentifier {
    return ReportModelIdentifier(id: id);
  }

  String get subject {
    try {
      return _subject!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  ReportType? get type {
    return _type;
  }

  ReportStatus? get status {
    return _status;
  }

  bool get archived {
    try {
      return _archived!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get details {
    try {
      return _details!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  Staff? get auditor {
    return _auditor;
  }

  amplify_core.TemporalDateTime? get reportedAt {
    return _reportedAt;
  }

  bool get discrepanciesFound {
    try {
      return _discrepanciesFound!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  Staff? get closer {
    return _closer;
  }

  amplify_core.TemporalDateTime? get closeAt {
    return _closeAt;
  }

  List<ReportStaff>? get recipients {
    return _recipients;
  }

  List<ReportDocument>? get documents {
    return _documents;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Report._internal(
      {required this.id,
      required subject,
      type,
      status,
      required archived,
      required details,
      auditor,
      reportedAt,
      required discrepanciesFound,
      closer,
      closeAt,
      recipients,
      documents,
      createdAt,
      updatedAt})
      : _subject = subject,
        _type = type,
        _status = status,
        _archived = archived,
        _details = details,
        _auditor = auditor,
        _reportedAt = reportedAt,
        _discrepanciesFound = discrepanciesFound,
        _closer = closer,
        _closeAt = closeAt,
        _recipients = recipients,
        _documents = documents,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Report(
      {String? id,
      required String subject,
      ReportType? type,
      ReportStatus? status,
      required bool archived,
      required String details,
      Staff? auditor,
      amplify_core.TemporalDateTime? reportedAt,
      required bool discrepanciesFound,
      Staff? closer,
      amplify_core.TemporalDateTime? closeAt,
      List<ReportStaff>? recipients,
      List<ReportDocument>? documents}) {
    return Report._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        subject: subject,
        type: type,
        status: status,
        archived: archived,
        details: details,
        auditor: auditor,
        reportedAt: reportedAt,
        discrepanciesFound: discrepanciesFound,
        closer: closer,
        closeAt: closeAt,
        recipients: recipients != null
            ? List<ReportStaff>.unmodifiable(recipients)
            : recipients,
        documents: documents != null
            ? List<ReportDocument>.unmodifiable(documents)
            : documents);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Report &&
        id == other.id &&
        _subject == other._subject &&
        _type == other._type &&
        _status == other._status &&
        _archived == other._archived &&
        _details == other._details &&
        _auditor == other._auditor &&
        _reportedAt == other._reportedAt &&
        _discrepanciesFound == other._discrepanciesFound &&
        _closer == other._closer &&
        _closeAt == other._closeAt &&
        DeepCollectionEquality().equals(_recipients, other._recipients) &&
        DeepCollectionEquality().equals(_documents, other._documents);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Report {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("subject=" + "$_subject" + ", ");
    buffer.write("type=" +
        (_type != null ? amplify_core.enumToString(_type)! : "null") +
        ", ");
    buffer.write("status=" +
        (_status != null ? amplify_core.enumToString(_status)! : "null") +
        ", ");
    buffer.write("archived=" +
        (_archived != null ? _archived.toString() : "null") +
        ", ");
    buffer.write("details=" + "$_details" + ", ");
    buffer.write(
        "auditor=" + (_auditor != null ? _auditor.toString() : "null") + ", ");
    buffer.write("reportedAt=" +
        (_reportedAt != null ? _reportedAt.format() : "null") +
        ", ");
    buffer.write("discrepanciesFound=" +
        (_discrepanciesFound != null
            ? _discrepanciesFound.toString()
            : "null") +
        ", ");
    buffer.write(
        "closer=" + (_closer != null ? _closer.toString() : "null") + ", ");
    buffer.write(
        "closeAt=" + (_closeAt != null ? _closeAt.format() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Report copyWith(
      {String? subject,
      ReportType? type,
      ReportStatus? status,
      bool? archived,
      String? details,
      Staff? auditor,
      amplify_core.TemporalDateTime? reportedAt,
      bool? discrepanciesFound,
      Staff? closer,
      amplify_core.TemporalDateTime? closeAt,
      List<ReportStaff>? recipients,
      List<ReportDocument>? documents}) {
    return Report._internal(
        id: id,
        subject: subject ?? this.subject,
        type: type ?? this.type,
        status: status ?? this.status,
        archived: archived ?? this.archived,
        details: details ?? this.details,
        auditor: auditor ?? this.auditor,
        reportedAt: reportedAt ?? this.reportedAt,
        discrepanciesFound: discrepanciesFound ?? this.discrepanciesFound,
        closer: closer ?? this.closer,
        closeAt: closeAt ?? this.closeAt,
        recipients: recipients ?? this.recipients,
        documents: documents ?? this.documents);
  }

  Report copyWithModelFieldValues(
      {ModelFieldValue<String>? subject,
      ModelFieldValue<ReportType?>? type,
      ModelFieldValue<ReportStatus?>? status,
      ModelFieldValue<bool>? archived,
      ModelFieldValue<String>? details,
      ModelFieldValue<Staff?>? auditor,
      ModelFieldValue<amplify_core.TemporalDateTime?>? reportedAt,
      ModelFieldValue<bool>? discrepanciesFound,
      ModelFieldValue<Staff?>? closer,
      ModelFieldValue<amplify_core.TemporalDateTime?>? closeAt,
      ModelFieldValue<List<ReportStaff>?>? recipients,
      ModelFieldValue<List<ReportDocument>?>? documents}) {
    return Report._internal(
        id: id,
        subject: subject == null ? this.subject : subject.value,
        type: type == null ? this.type : type.value,
        status: status == null ? this.status : status.value,
        archived: archived == null ? this.archived : archived.value,
        details: details == null ? this.details : details.value,
        auditor: auditor == null ? this.auditor : auditor.value,
        reportedAt: reportedAt == null ? this.reportedAt : reportedAt.value,
        discrepanciesFound: discrepanciesFound == null
            ? this.discrepanciesFound
            : discrepanciesFound.value,
        closer: closer == null ? this.closer : closer.value,
        closeAt: closeAt == null ? this.closeAt : closeAt.value,
        recipients: recipients == null ? this.recipients : recipients.value,
        documents: documents == null ? this.documents : documents.value);
  }

  Report.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _subject = json['subject'],
        _type = amplify_core.enumFromString<ReportType>(
            json['type'], ReportType.values),
        _status = amplify_core.enumFromString<ReportStatus>(
            json['status'], ReportStatus.values),
        _archived = json['archived'],
        _details = json['details'],
        _auditor = json['auditor'] != null
            ? json['auditor']['serializedData'] != null
                ? Staff.fromJson(new Map<String, dynamic>.from(
                    json['auditor']['serializedData']))
                : Staff.fromJson(new Map<String, dynamic>.from(json['auditor']))
            : null,
        _reportedAt = json['reportedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['reportedAt'])
            : null,
        _discrepanciesFound = json['discrepanciesFound'],
        _closer = json['closer'] != null
            ? json['closer']['serializedData'] != null
                ? Staff.fromJson(new Map<String, dynamic>.from(
                    json['closer']['serializedData']))
                : Staff.fromJson(new Map<String, dynamic>.from(json['closer']))
            : null,
        _closeAt = json['closeAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['closeAt'])
            : null,
        _recipients = json['recipients'] is Map
            ? (json['recipients']['items'] is List
                ? (json['recipients']['items'] as List)
                    .where((e) => e != null)
                    .map((e) =>
                        ReportStaff.fromJson(new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['recipients'] is List
                ? (json['recipients'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => ReportStaff.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _documents = json['documents'] is Map
            ? (json['documents']['items'] is List
                ? (json['documents']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => ReportDocument.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['documents'] is List
                ? (json['documents'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => ReportDocument.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'subject': _subject,
        'type': amplify_core.enumToString(_type),
        'status': amplify_core.enumToString(_status),
        'archived': _archived,
        'details': _details,
        'auditor': _auditor?.toJson(),
        'reportedAt': _reportedAt?.format(),
        'discrepanciesFound': _discrepanciesFound,
        'closer': _closer?.toJson(),
        'closeAt': _closeAt?.format(),
        'recipients':
            _recipients?.map((ReportStaff? e) => e?.toJson()).toList(),
        'documents':
            _documents?.map((ReportDocument? e) => e?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'subject': _subject,
        'type': _type,
        'status': _status,
        'archived': _archived,
        'details': _details,
        'auditor': _auditor,
        'reportedAt': _reportedAt,
        'discrepanciesFound': _discrepanciesFound,
        'closer': _closer,
        'closeAt': _closeAt,
        'recipients': _recipients,
        'documents': _documents,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<ReportModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<ReportModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final SUBJECT = amplify_core.QueryField(fieldName: "subject");
  static final TYPE = amplify_core.QueryField(fieldName: "type");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final DETAILS = amplify_core.QueryField(fieldName: "details");
  static final AUDITOR = amplify_core.QueryField(
      fieldName: "auditor",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Staff'));
  static final REPORTEDAT = amplify_core.QueryField(fieldName: "reportedAt");
  static final DISCREPANCIESFOUND =
      amplify_core.QueryField(fieldName: "discrepanciesFound");
  static final CLOSER = amplify_core.QueryField(
      fieldName: "closer",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Staff'));
  static final CLOSEAT = amplify_core.QueryField(fieldName: "closeAt");
  static final RECIPIENTS = amplify_core.QueryField(
      fieldName: "recipients",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'ReportStaff'));
  static final DOCUMENTS = amplify_core.QueryField(
      fieldName: "documents",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'ReportDocument'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Report";
    modelSchemaDefinition.pluralName = "Reports";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.PRIVATE,
          operations: const [
            amplify_core.ModelOperation.CREATE,
            amplify_core.ModelOperation.UPDATE,
            amplify_core.ModelOperation.DELETE,
            amplify_core.ModelOperation.READ
          ])
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Report.SUBJECT,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Report.TYPE,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Report.STATUS,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Report.ARCHIVED,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Report.DETAILS,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Report.AUDITOR,
        isRequired: false,
        targetNames: ['auditorId'],
        ofModelName: 'Staff'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Report.REPORTEDAT,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Report.DISCREPANCIESFOUND,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Report.CLOSER,
        isRequired: false,
        targetNames: ['closerId'],
        ofModelName: 'Staff'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Report.CLOSEAT,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Report.RECIPIENTS,
        isRequired: false,
        ofModelName: 'ReportStaff',
        associatedKey: ReportStaff.REPORT));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Report.DOCUMENTS,
        isRequired: false,
        ofModelName: 'ReportDocument',
        associatedKey: ReportDocument.REPORTS));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'createdAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'updatedAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));
  });
}

class _ReportModelType extends amplify_core.ModelType<Report> {
  const _ReportModelType();

  @override
  Report fromJson(Map<String, dynamic> jsonData) {
    return Report.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Report';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Report] in your schema.
 */
class ReportModelIdentifier implements amplify_core.ModelIdentifier<Report> {
  final String id;

  /** Create an instance of ReportModelIdentifier using [id] the primary key. */
  const ReportModelIdentifier({required this.id});

  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{'id': id});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'ReportModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ReportModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
