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

/** This is an auto generated class representing the ReminderDocument type in your schema. */
class ReminderDocument extends amplify_core.Model {
  static const classType = const _ReminderDocumentModelType();
  final String? _reminderId;
  final String? _documentId;
  final Reminder? _reminder;
  final Document? _document;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();

  ReminderDocumentModelIdentifier get modelIdentifier {
    try {
      return ReminderDocumentModelIdentifier(
          reminderId: _reminderId!, documentId: _documentId!);
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get reminderId {
    try {
      return _reminderId!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get documentId {
    try {
      return _documentId!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  Reminder? get reminder {
    return _reminder;
  }

  Document? get document {
    return _document;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const ReminderDocument._internal(
      {required reminderId,
      required documentId,
      reminder,
      document,
      createdAt,
      updatedAt})
      : _reminderId = reminderId,
        _documentId = documentId,
        _reminder = reminder,
        _document = document,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory ReminderDocument(
      {required String reminderId,
      required String documentId,
      Reminder? reminder,
      Document? document}) {
    return ReminderDocument._internal(
        reminderId: reminderId,
        documentId: documentId,
        reminder: reminder,
        document: document);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReminderDocument &&
        _reminderId == other._reminderId &&
        _documentId == other._documentId &&
        _reminder == other._reminder &&
        _document == other._document;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ReminderDocument {");
    buffer.write("reminderId=" + "$_reminderId" + ", ");
    buffer.write("documentId=" + "$_documentId" + ", ");
    buffer.write("reminder=" +
        (_reminder != null ? _reminder!.toString() : "null") +
        ", ");
    buffer.write("document=" +
        (_document != null ? _document!.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  ReminderDocument copyWith({Reminder? reminder, Document? document}) {
    return ReminderDocument._internal(
        reminderId: reminderId,
        documentId: documentId,
        reminder: reminder ?? this.reminder,
        document: document ?? this.document);
  }

  ReminderDocument copyWithModelFieldValues(
      {ModelFieldValue<Reminder?>? reminder,
      ModelFieldValue<Document?>? document}) {
    return ReminderDocument._internal(
        reminderId: reminderId,
        documentId: documentId,
        reminder: reminder == null ? this.reminder : reminder.value,
        document: document == null ? this.document : document.value);
  }

  ReminderDocument.fromJson(Map<String, dynamic> json)
      : _reminderId = json['reminderId'],
        _documentId = json['documentId'],
        _reminder = json['reminder'] != null
            ? json['reminder']['serializedData'] != null
                ? Reminder.fromJson(new Map<String, dynamic>.from(
                    json['reminder']['serializedData']))
                : Reminder.fromJson(
                    new Map<String, dynamic>.from(json['reminder']))
            : null,
        _document = json['document'] != null
            ? json['document']['serializedData'] != null
                ? Document.fromJson(new Map<String, dynamic>.from(
                    json['document']['serializedData']))
                : Document.fromJson(
                    new Map<String, dynamic>.from(json['document']))
            : null,
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'reminderId': _reminderId,
        'documentId': _documentId,
        'reminder': _reminder?.toJson(),
        'document': _document?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'reminderId': _reminderId,
        'documentId': _documentId,
        'reminder': _reminder,
        'document': _document,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core
      .QueryModelIdentifier<ReminderDocumentModelIdentifier> MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<ReminderDocumentModelIdentifier>();
  static final REMINDERID = amplify_core.QueryField(fieldName: "reminderId");
  static final DOCUMENTID = amplify_core.QueryField(fieldName: "documentId");
  static final REMINDER = amplify_core.QueryField(
      fieldName: "reminder",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Reminder'));
  static final DOCUMENT = amplify_core.QueryField(
      fieldName: "document",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Document'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ReminderDocument";
    modelSchemaDefinition.pluralName = "ReminderDocuments";

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

    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(
          fields: const ["reminderId", "documentId"], name: null)
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: ReminderDocument.REMINDERID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: ReminderDocument.DOCUMENTID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: ReminderDocument.REMINDER,
        isRequired: false,
        targetNames: ['reminderId'],
        ofModelName: 'Reminder'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: ReminderDocument.DOCUMENT,
        isRequired: false,
        targetNames: ['documentId'],
        ofModelName: 'Document'));

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

class _ReminderDocumentModelType
    extends amplify_core.ModelType<ReminderDocument> {
  const _ReminderDocumentModelType();

  @override
  ReminderDocument fromJson(Map<String, dynamic> jsonData) {
    return ReminderDocument.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'ReminderDocument';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ReminderDocument] in your schema.
 */
class ReminderDocumentModelIdentifier
    implements amplify_core.ModelIdentifier<ReminderDocument> {
  final String reminderId;
  final String documentId;

  /**
   * Create an instance of ReminderDocumentModelIdentifier using [reminderId] the primary key.
   * And [documentId] the sort key.
   */
  const ReminderDocumentModelIdentifier(
      {required this.reminderId, required this.documentId});

  @override
  Map<String, dynamic> serializeAsMap() =>
      (<String, dynamic>{'reminderId': reminderId, 'documentId': documentId});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() =>
      'ReminderDocumentModelIdentifier(reminderId: $reminderId, documentId: $documentId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ReminderDocumentModelIdentifier &&
        reminderId == other.reminderId &&
        documentId == other.documentId;
  }

  @override
  int get hashCode => reminderId.hashCode ^ documentId.hashCode;
}
