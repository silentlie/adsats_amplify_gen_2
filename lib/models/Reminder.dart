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

/** This is an auto generated class representing the Reminder type in your schema. */
class Reminder extends amplify_core.Model {
  static const classType = const _ReminderModelType();
  final String id;
  final amplify_core.TemporalDateTime? _date;
  final List<ReminderStaff>? _staff;
  final List<ReminderDocument>? _documents;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  ReminderModelIdentifier get modelIdentifier {
    return ReminderModelIdentifier(id: id);
  }

  amplify_core.TemporalDateTime get date {
    try {
      return _date!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  List<ReminderStaff>? get staff {
    return _staff;
  }

  List<ReminderDocument>? get documents {
    return _documents;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Reminder._internal(
      {required this.id, required date, staff, documents, createdAt, updatedAt})
      : _date = date,
        _staff = staff,
        _documents = documents,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Reminder(
      {String? id,
      required amplify_core.TemporalDateTime date,
      List<ReminderStaff>? staff,
      List<ReminderDocument>? documents}) {
    return Reminder._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        date: date,
        staff: staff != null ? List<ReminderStaff>.unmodifiable(staff) : staff,
        documents: documents != null
            ? List<ReminderDocument>.unmodifiable(documents)
            : documents);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reminder &&
        id == other.id &&
        _date == other._date &&
        DeepCollectionEquality().equals(_staff, other._staff) &&
        DeepCollectionEquality().equals(_documents, other._documents);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Reminder {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Reminder copyWith(
      {amplify_core.TemporalDateTime? date,
      List<ReminderStaff>? staff,
      List<ReminderDocument>? documents}) {
    return Reminder._internal(
        id: id,
        date: date ?? this.date,
        staff: staff ?? this.staff,
        documents: documents ?? this.documents);
  }

  Reminder copyWithModelFieldValues(
      {ModelFieldValue<amplify_core.TemporalDateTime>? date,
      ModelFieldValue<List<ReminderStaff>?>? staff,
      ModelFieldValue<List<ReminderDocument>?>? documents}) {
    return Reminder._internal(
        id: id,
        date: date == null ? this.date : date.value,
        staff: staff == null ? this.staff : staff.value,
        documents: documents == null ? this.documents : documents.value);
  }

  Reminder.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _date = json['date'] != null
            ? amplify_core.TemporalDateTime.fromString(json['date'])
            : null,
        _staff = json['staff'] is Map
            ? (json['staff']['items'] is List
                ? (json['staff']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => ReminderStaff.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['staff'] is List
                ? (json['staff'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => ReminderStaff.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _documents = json['documents'] is Map
            ? (json['documents']['items'] is List
                ? (json['documents']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => ReminderDocument.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['documents'] is List
                ? (json['documents'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => ReminderDocument.fromJson(
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
        'date': _date?.format(),
        'staff': _staff?.map((ReminderStaff? e) => e?.toJson()).toList(),
        'documents':
            _documents?.map((ReminderDocument? e) => e?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'date': _date,
        'staff': _staff,
        'documents': _documents,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<ReminderModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<ReminderModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final STAFF = amplify_core.QueryField(
      fieldName: "staff",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'ReminderStaff'));
  static final DOCUMENTS = amplify_core.QueryField(
      fieldName: "documents",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'ReminderDocument'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Reminder";
    modelSchemaDefinition.pluralName = "Reminders";

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
        key: Reminder.DATE,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Reminder.STAFF,
        isRequired: false,
        ofModelName: 'ReminderStaff',
        associatedKey: ReminderStaff.REMINDER));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Reminder.DOCUMENTS,
        isRequired: false,
        ofModelName: 'ReminderDocument',
        associatedKey: ReminderDocument.REMINDER));

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

class _ReminderModelType extends amplify_core.ModelType<Reminder> {
  const _ReminderModelType();

  @override
  Reminder fromJson(Map<String, dynamic> jsonData) {
    return Reminder.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Reminder';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Reminder] in your schema.
 */
class ReminderModelIdentifier
    implements amplify_core.ModelIdentifier<Reminder> {
  final String id;

  /** Create an instance of ReminderModelIdentifier using [id] the primary key. */
  const ReminderModelIdentifier({required this.id});

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
  String toString() => 'ReminderModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ReminderModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
