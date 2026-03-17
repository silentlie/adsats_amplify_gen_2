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

/** This is an auto generated class representing the FlightCrewRecordCategory type in your schema. */
class FlightCrewRecordCategory extends amplify_core.Model {
  static const classType = const _FlightCrewRecordCategoryModelType();
  final String id;
  final String? _name;
  final bool? _archived;
  final String? _description;
  final Role? _role;
  final List<FlightCrewRecord>? _flightCrewRecords;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  FlightCrewRecordCategoryModelIdentifier get modelIdentifier {
    return FlightCrewRecordCategoryModelIdentifier(id: id);
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

  Role? get role {
    return _role;
  }

  List<FlightCrewRecord>? get flightCrewRecords {
    return _flightCrewRecords;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const FlightCrewRecordCategory._internal(
      {required this.id,
      required name,
      required archived,
      description,
      role,
      flightCrewRecords,
      createdAt,
      updatedAt})
      : _name = name,
        _archived = archived,
        _description = description,
        _role = role,
        _flightCrewRecords = flightCrewRecords,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory FlightCrewRecordCategory(
      {String? id,
      required String name,
      required bool archived,
      String? description,
      Role? role,
      List<FlightCrewRecord>? flightCrewRecords}) {
    return FlightCrewRecordCategory._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        name: name,
        archived: archived,
        description: description,
        role: role,
        flightCrewRecords: flightCrewRecords != null
            ? List<FlightCrewRecord>.unmodifiable(flightCrewRecords)
            : flightCrewRecords);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlightCrewRecordCategory &&
        id == other.id &&
        _name == other._name &&
        _archived == other._archived &&
        _description == other._description &&
        _role == other._role &&
        DeepCollectionEquality()
            .equals(_flightCrewRecords, other._flightCrewRecords);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("FlightCrewRecordCategory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("archived=" +
        (_archived != null ? _archived!.toString() : "null") +
        ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("role=" + (_role != null ? _role!.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  FlightCrewRecordCategory copyWith(
      {String? name,
      bool? archived,
      String? description,
      Role? role,
      List<FlightCrewRecord>? flightCrewRecords}) {
    return FlightCrewRecordCategory._internal(
        id: id,
        name: name ?? this.name,
        archived: archived ?? this.archived,
        description: description ?? this.description,
        role: role ?? this.role,
        flightCrewRecords: flightCrewRecords ?? this.flightCrewRecords);
  }

  FlightCrewRecordCategory copyWithModelFieldValues(
      {ModelFieldValue<String>? name,
      ModelFieldValue<bool>? archived,
      ModelFieldValue<String?>? description,
      ModelFieldValue<Role?>? role,
      ModelFieldValue<List<FlightCrewRecord>?>? flightCrewRecords}) {
    return FlightCrewRecordCategory._internal(
        id: id,
        name: name == null ? this.name : name.value,
        archived: archived == null ? this.archived : archived.value,
        description: description == null ? this.description : description.value,
        role: role == null ? this.role : role.value,
        flightCrewRecords: flightCrewRecords == null
            ? this.flightCrewRecords
            : flightCrewRecords.value);
  }

  FlightCrewRecordCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _archived = json['archived'],
        _description = json['description'],
        _role = json['role'] != null
            ? json['role']['serializedData'] != null
                ? Role.fromJson(new Map<String, dynamic>.from(
                    json['role']['serializedData']))
                : Role.fromJson(new Map<String, dynamic>.from(json['role']))
            : null,
        _flightCrewRecords = json['flightCrewRecords'] is Map
            ? (json['flightCrewRecords']['items'] is List
                ? (json['flightCrewRecords']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => FlightCrewRecord.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['flightCrewRecords'] is List
                ? (json['flightCrewRecords'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => FlightCrewRecord.fromJson(
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
        'role': _role?.toJson(),
        'flightCrewRecords': _flightCrewRecords
            ?.map((FlightCrewRecord? e) => e?.toJson())
            .toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'name': _name,
        'archived': _archived,
        'description': _description,
        'role': _role,
        'flightCrewRecords': _flightCrewRecords,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core
      .QueryModelIdentifier<FlightCrewRecordCategoryModelIdentifier>
      MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<
          FlightCrewRecordCategoryModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final ROLE = amplify_core.QueryField(
      fieldName: "role",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Role'));
  static final FLIGHTCREWRECORDS = amplify_core.QueryField(
      fieldName: "flightCrewRecords",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'FlightCrewRecord'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FlightCrewRecordCategory";
    modelSchemaDefinition.pluralName = "FlightCrewRecordCategories";

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
        key: FlightCrewRecordCategory.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: FlightCrewRecordCategory.ARCHIVED,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: FlightCrewRecordCategory.DESCRIPTION,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: FlightCrewRecordCategory.ROLE,
        isRequired: false,
        targetNames: ['roleId'],
        ofModelName: 'Role'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: FlightCrewRecordCategory.FLIGHTCREWRECORDS,
        isRequired: false,
        ofModelName: 'FlightCrewRecord',
        associatedKey: FlightCrewRecord.CATEGORY));

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

class _FlightCrewRecordCategoryModelType
    extends amplify_core.ModelType<FlightCrewRecordCategory> {
  const _FlightCrewRecordCategoryModelType();

  @override
  FlightCrewRecordCategory fromJson(Map<String, dynamic> jsonData) {
    return FlightCrewRecordCategory.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'FlightCrewRecordCategory';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FlightCrewRecordCategory] in your schema.
 */
class FlightCrewRecordCategoryModelIdentifier
    implements amplify_core.ModelIdentifier<FlightCrewRecordCategory> {
  final String id;

  /** Create an instance of FlightCrewRecordCategoryModelIdentifier using [id] the primary key. */
  const FlightCrewRecordCategoryModelIdentifier({required this.id});

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
  String toString() => 'FlightCrewRecordCategoryModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is FlightCrewRecordCategoryModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
