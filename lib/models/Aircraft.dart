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

/** This is an auto generated class representing the Aircraft type in your schema. */
class Aircraft extends amplify_core.Model {
  static const classType = const _AircraftModelType();
  final String id;
  final String? _name;
  final bool? _archived;
  final String? _description;
  final List<AircraftStaff>? _staff;
  final List<AircraftDocument>? _document;
  final List<AircraftNotice>? _notices;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  AircraftModelIdentifier get modelIdentifier {
    return AircraftModelIdentifier(id: id);
  }

  String get name {
    try {
      return _name!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
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

  String? get description {
    return _description;
  }

  List<AircraftStaff>? get staff {
    return _staff;
  }

  List<AircraftDocument>? get document {
    return _document;
  }

  List<AircraftNotice>? get notices {
    return _notices;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Aircraft._internal(
      {required this.id,
      required name,
      required archived,
      description,
      staff,
      document,
      notices,
      createdAt,
      updatedAt})
      : _name = name,
        _archived = archived,
        _description = description,
        _staff = staff,
        _document = document,
        _notices = notices,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Aircraft(
      {String? id,
      required String name,
      required bool archived,
      String? description,
      List<AircraftStaff>? staff,
      List<AircraftDocument>? document,
      List<AircraftNotice>? notices}) {
    return Aircraft._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        name: name,
        archived: archived,
        description: description,
        staff: staff != null ? List<AircraftStaff>.unmodifiable(staff) : staff,
        document: document != null
            ? List<AircraftDocument>.unmodifiable(document)
            : document,
        notices: notices != null
            ? List<AircraftNotice>.unmodifiable(notices)
            : notices);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Aircraft &&
        id == other.id &&
        _name == other._name &&
        _archived == other._archived &&
        _description == other._description &&
        DeepCollectionEquality().equals(_staff, other._staff) &&
        DeepCollectionEquality().equals(_document, other._document) &&
        DeepCollectionEquality().equals(_notices, other._notices);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Aircraft {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("archived=" +
        (_archived != null ? _archived.toString() : "null") +
        ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Aircraft copyWith(
      {String? name,
      bool? archived,
      String? description,
      List<AircraftStaff>? staff,
      List<AircraftDocument>? document,
      List<AircraftNotice>? notices}) {
    return Aircraft._internal(
        id: id,
        name: name ?? this.name,
        archived: archived ?? this.archived,
        description: description ?? this.description,
        staff: staff ?? this.staff,
        document: document ?? this.document,
        notices: notices ?? this.notices);
  }

  Aircraft copyWithModelFieldValues(
      {ModelFieldValue<String>? name,
      ModelFieldValue<bool>? archived,
      ModelFieldValue<String?>? description,
      ModelFieldValue<List<AircraftStaff>?>? staff,
      ModelFieldValue<List<AircraftDocument>?>? document,
      ModelFieldValue<List<AircraftNotice>?>? notices}) {
    return Aircraft._internal(
        id: id,
        name: name == null ? this.name : name.value,
        archived: archived == null ? this.archived : archived.value,
        description: description == null ? this.description : description.value,
        staff: staff == null ? this.staff : staff.value,
        document: document == null ? this.document : document.value,
        notices: notices == null ? this.notices : notices.value);
  }

  Aircraft.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _archived = json['archived'],
        _description = json['description'],
        _staff = json['staff'] is Map
            ? (json['staff']['items'] is List
                ? (json['staff']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => AircraftStaff.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['staff'] is List
                ? (json['staff'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => AircraftStaff.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _document = json['document'] is Map
            ? (json['document']['items'] is List
                ? (json['document']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => AircraftDocument.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['document'] is List
                ? (json['document'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => AircraftDocument.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _notices = json['notices'] is Map
            ? (json['notices']['items'] is List
                ? (json['notices']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => AircraftNotice.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['notices'] is List
                ? (json['notices'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => AircraftNotice.fromJson(
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
        'name': _name,
        'archived': _archived,
        'description': _description,
        'staff': _staff?.map((AircraftStaff? e) => e?.toJson()).toList(),
        'document':
            _document?.map((AircraftDocument? e) => e?.toJson()).toList(),
        'notices': _notices?.map((AircraftNotice? e) => e?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'name': _name,
        'archived': _archived,
        'description': _description,
        'staff': _staff,
        'document': _document,
        'notices': _notices,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<AircraftModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<AircraftModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final STAFF = amplify_core.QueryField(
      fieldName: "staff",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'AircraftStaff'));
  static final DOCUMENT = amplify_core.QueryField(
      fieldName: "document",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'AircraftDocument'));
  static final NOTICES = amplify_core.QueryField(
      fieldName: "notices",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'AircraftNotice'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Aircraft";
    modelSchemaDefinition.pluralName = "Aircraft";

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
        key: Aircraft.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Aircraft.ARCHIVED,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Aircraft.DESCRIPTION,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Aircraft.STAFF,
        isRequired: false,
        ofModelName: 'AircraftStaff',
        associatedKey: AircraftStaff.AIRCRAFT));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Aircraft.DOCUMENT,
        isRequired: false,
        ofModelName: 'AircraftDocument',
        associatedKey: AircraftDocument.AIRCRAFT));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Aircraft.NOTICES,
        isRequired: false,
        ofModelName: 'AircraftNotice',
        associatedKey: AircraftNotice.AIRCRAFT));

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

class _AircraftModelType extends amplify_core.ModelType<Aircraft> {
  const _AircraftModelType();

  @override
  Aircraft fromJson(Map<String, dynamic> jsonData) {
    return Aircraft.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Aircraft';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Aircraft] in your schema.
 */
class AircraftModelIdentifier
    implements amplify_core.ModelIdentifier<Aircraft> {
  final String id;

  /** Create an instance of AircraftModelIdentifier using [id] the primary key. */
  const AircraftModelIdentifier({required this.id});

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
  String toString() => 'AircraftModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AircraftModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
