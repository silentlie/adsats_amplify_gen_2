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

/** This is an auto generated class representing the Notice type in your schema. */
class Notice extends amplify_core.Model {
  static const classType = const _NoticeModelType();
  final String id;
  final String? _subject;
  final NoticeType? _type;
  final NoticeStatus? _status;
  final bool? _archived;
  final String? _details;
  final amplify_core.TemporalDateTime? _noticed_at;
  final amplify_core.TemporalDateTime? _deadline_at;
  final Staff? _author;
  final List<Notification>? _recipients;
  final List<AircraftNotice>? _aircraft;
  final List<NoticeDocument>? _documents;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  NoticeModelIdentifier get modelIdentifier {
    return NoticeModelIdentifier(id: id);
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

  NoticeType? get type {
    return _type;
  }

  NoticeStatus? get status {
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

  amplify_core.TemporalDateTime? get noticed_at {
    return _noticed_at;
  }

  amplify_core.TemporalDateTime? get deadline_at {
    return _deadline_at;
  }

  Staff? get author {
    return _author;
  }

  List<Notification>? get recipients {
    return _recipients;
  }

  List<AircraftNotice>? get aircraft {
    return _aircraft;
  }

  List<NoticeDocument>? get documents {
    return _documents;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Notice._internal(
      {required this.id,
      required subject,
      type,
      status,
      required archived,
      required details,
      noticed_at,
      deadline_at,
      author,
      recipients,
      aircraft,
      documents,
      createdAt,
      updatedAt})
      : _subject = subject,
        _type = type,
        _status = status,
        _archived = archived,
        _details = details,
        _noticed_at = noticed_at,
        _deadline_at = deadline_at,
        _author = author,
        _recipients = recipients,
        _aircraft = aircraft,
        _documents = documents,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Notice(
      {String? id,
      required String subject,
      NoticeType? type,
      NoticeStatus? status,
      required bool archived,
      required String details,
      amplify_core.TemporalDateTime? noticed_at,
      amplify_core.TemporalDateTime? deadline_at,
      Staff? author,
      List<Notification>? recipients,
      List<AircraftNotice>? aircraft,
      List<NoticeDocument>? documents}) {
    return Notice._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        subject: subject,
        type: type,
        status: status,
        archived: archived,
        details: details,
        noticed_at: noticed_at,
        deadline_at: deadline_at,
        author: author,
        recipients: recipients != null
            ? List<Notification>.unmodifiable(recipients)
            : recipients,
        aircraft: aircraft != null
            ? List<AircraftNotice>.unmodifiable(aircraft)
            : aircraft,
        documents: documents != null
            ? List<NoticeDocument>.unmodifiable(documents)
            : documents);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Notice &&
        id == other.id &&
        _subject == other._subject &&
        _type == other._type &&
        _status == other._status &&
        _archived == other._archived &&
        _details == other._details &&
        _noticed_at == other._noticed_at &&
        _deadline_at == other._deadline_at &&
        _author == other._author &&
        DeepCollectionEquality().equals(_recipients, other._recipients) &&
        DeepCollectionEquality().equals(_aircraft, other._aircraft) &&
        DeepCollectionEquality().equals(_documents, other._documents);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Notice {");
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
    buffer.write("noticed_at=" +
        (_noticed_at != null ? _noticed_at.format() : "null") +
        ", ");
    buffer.write("deadline_at=" +
        (_deadline_at != null ? _deadline_at.format() : "null") +
        ", ");
    buffer.write(
        "author=" + (_author != null ? _author.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Notice copyWith(
      {String? subject,
      NoticeType? type,
      NoticeStatus? status,
      bool? archived,
      String? details,
      amplify_core.TemporalDateTime? noticed_at,
      amplify_core.TemporalDateTime? deadline_at,
      Staff? author,
      List<Notification>? recipients,
      List<AircraftNotice>? aircraft,
      List<NoticeDocument>? documents}) {
    return Notice._internal(
        id: id,
        subject: subject ?? this.subject,
        type: type ?? this.type,
        status: status ?? this.status,
        archived: archived ?? this.archived,
        details: details ?? this.details,
        noticed_at: noticed_at ?? this.noticed_at,
        deadline_at: deadline_at ?? this.deadline_at,
        author: author ?? this.author,
        recipients: recipients ?? this.recipients,
        aircraft: aircraft ?? this.aircraft,
        documents: documents ?? this.documents);
  }

  Notice copyWithModelFieldValues(
      {ModelFieldValue<String>? subject,
      ModelFieldValue<NoticeType?>? type,
      ModelFieldValue<NoticeStatus?>? status,
      ModelFieldValue<bool>? archived,
      ModelFieldValue<String>? details,
      ModelFieldValue<amplify_core.TemporalDateTime?>? noticed_at,
      ModelFieldValue<amplify_core.TemporalDateTime?>? deadline_at,
      ModelFieldValue<Staff?>? author,
      ModelFieldValue<List<Notification>?>? recipients,
      ModelFieldValue<List<AircraftNotice>?>? aircraft,
      ModelFieldValue<List<NoticeDocument>?>? documents}) {
    return Notice._internal(
        id: id,
        subject: subject == null ? this.subject : subject.value,
        type: type == null ? this.type : type.value,
        status: status == null ? this.status : status.value,
        archived: archived == null ? this.archived : archived.value,
        details: details == null ? this.details : details.value,
        noticed_at: noticed_at == null ? this.noticed_at : noticed_at.value,
        deadline_at: deadline_at == null ? this.deadline_at : deadline_at.value,
        author: author == null ? this.author : author.value,
        recipients: recipients == null ? this.recipients : recipients.value,
        aircraft: aircraft == null ? this.aircraft : aircraft.value,
        documents: documents == null ? this.documents : documents.value);
  }

  Notice.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _subject = json['subject'],
        _type = amplify_core.enumFromString<NoticeType>(
            json['type'], NoticeType.values),
        _status = amplify_core.enumFromString<NoticeStatus>(
            json['status'], NoticeStatus.values),
        _archived = json['archived'],
        _details = json['details'],
        _noticed_at = json['noticed_at'] != null
            ? amplify_core.TemporalDateTime.fromString(json['noticed_at'])
            : null,
        _deadline_at = json['deadline_at'] != null
            ? amplify_core.TemporalDateTime.fromString(json['deadline_at'])
            : null,
        _author = json['author'] != null
            ? json['author']['serializedData'] != null
                ? Staff.fromJson(new Map<String, dynamic>.from(
                    json['author']['serializedData']))
                : Staff.fromJson(new Map<String, dynamic>.from(json['author']))
            : null,
        _recipients = json['recipients'] is Map
            ? (json['recipients']['items'] is List
                ? (json['recipients']['items'] as List)
                    .where((e) => e != null)
                    .map((e) =>
                        Notification.fromJson(new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['recipients'] is List
                ? (json['recipients'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => Notification.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _aircraft = json['aircraft'] is Map
            ? (json['aircraft']['items'] is List
                ? (json['aircraft']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => AircraftNotice.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['aircraft'] is List
                ? (json['aircraft'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => AircraftNotice.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _documents = json['documents'] is Map
            ? (json['documents']['items'] is List
                ? (json['documents']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => NoticeDocument.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['documents'] is List
                ? (json['documents'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => NoticeDocument.fromJson(
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
        'noticed_at': _noticed_at?.format(),
        'deadline_at': _deadline_at?.format(),
        'author': _author?.toJson(),
        'recipients':
            _recipients?.map((Notification? e) => e?.toJson()).toList(),
        'aircraft': _aircraft?.map((AircraftNotice? e) => e?.toJson()).toList(),
        'documents':
            _documents?.map((NoticeDocument? e) => e?.toJson()).toList(),
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
        'noticed_at': _noticed_at,
        'deadline_at': _deadline_at,
        'author': _author,
        'recipients': _recipients,
        'aircraft': _aircraft,
        'documents': _documents,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<NoticeModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<NoticeModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final SUBJECT = amplify_core.QueryField(fieldName: "subject");
  static final TYPE = amplify_core.QueryField(fieldName: "type");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final DETAILS = amplify_core.QueryField(fieldName: "details");
  static final NOTICED_AT = amplify_core.QueryField(fieldName: "noticed_at");
  static final DEADLINE_AT = amplify_core.QueryField(fieldName: "deadline_at");
  static final AUTHOR = amplify_core.QueryField(
      fieldName: "author",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Staff'));
  static final RECIPIENTS = amplify_core.QueryField(
      fieldName: "recipients",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Notification'));
  static final AIRCRAFT = amplify_core.QueryField(
      fieldName: "aircraft",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'AircraftNotice'));
  static final DOCUMENTS = amplify_core.QueryField(
      fieldName: "documents",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'NoticeDocument'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Notice";
    modelSchemaDefinition.pluralName = "Notices";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.PRIVATE,
          operations: const [
            amplify_core.ModelOperation.CREATE,
            amplify_core.ModelOperation.READ,
            amplify_core.ModelOperation.UPDATE
          ]),
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.GROUPS,
          groupClaim: "cognito:groups",
          groups: const ["admins"],
          provider: amplify_core.AuthRuleProvider.USERPOOLS,
          operations: const [
            amplify_core.ModelOperation.CREATE,
            amplify_core.ModelOperation.UPDATE,
            amplify_core.ModelOperation.DELETE,
            amplify_core.ModelOperation.READ
          ])
    ];

    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(
          fields: const ["subject"], name: "noticesBySubject")
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Notice.SUBJECT,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Notice.TYPE,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Notice.STATUS,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Notice.ARCHIVED,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Notice.DETAILS,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Notice.NOTICED_AT,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Notice.DEADLINE_AT,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Notice.AUTHOR,
        isRequired: false,
        targetNames: ['staffId'],
        ofModelName: 'Staff'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Notice.RECIPIENTS,
        isRequired: false,
        ofModelName: 'Notification',
        associatedKey: Notification.NOTICE));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Notice.AIRCRAFT,
        isRequired: false,
        ofModelName: 'AircraftNotice',
        associatedKey: AircraftNotice.NOTICE));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Notice.DOCUMENTS,
        isRequired: false,
        ofModelName: 'NoticeDocument',
        associatedKey: NoticeDocument.NOTICES));

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

class _NoticeModelType extends amplify_core.ModelType<Notice> {
  const _NoticeModelType();

  @override
  Notice fromJson(Map<String, dynamic> jsonData) {
    return Notice.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Notice';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Notice] in your schema.
 */
class NoticeModelIdentifier implements amplify_core.ModelIdentifier<Notice> {
  final String id;

  /** Create an instance of NoticeModelIdentifier using [id] the primary key. */
  const NoticeModelIdentifier({required this.id});

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
  String toString() => 'NoticeModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NoticeModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
