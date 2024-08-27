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

/** This is an auto generated class representing the Role type in your schema. */
class Role extends amplify_core.Model {
  static const classType = const _RoleModelType();
  final String id;
  final String? _name;
  final bool? _archived;
  final String? _description;
  final List<RoleStaff>? _staff;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  RoleModelIdentifier get modelIdentifier {
    return RoleModelIdentifier(id: id);
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

  List<RoleStaff>? get staff {
    return _staff;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Role._internal(
      {required this.id,
      required name,
      required archived,
      description,
      staff,
      createdAt,
      updatedAt})
      : _name = name,
        _archived = archived,
        _description = description,
        _staff = staff,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Role(
      {String? id,
      required String name,
      required bool archived,
      String? description,
      List<RoleStaff>? staff}) {
    return Role._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        name: name,
        archived: archived,
        description: description,
        staff: staff != null ? List<RoleStaff>.unmodifiable(staff) : staff);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Role &&
        id == other.id &&
        _name == other._name &&
        _archived == other._archived &&
        _description == other._description &&
        DeepCollectionEquality().equals(_staff, other._staff);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Role {");
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

  Role copyWith(
      {String? name,
      bool? archived,
      String? description,
      List<RoleStaff>? staff}) {
    return Role._internal(
        id: id,
        name: name ?? this.name,
        archived: archived ?? this.archived,
        description: description ?? this.description,
        staff: staff ?? this.staff);
  }

  Role copyWithModelFieldValues(
      {ModelFieldValue<String>? name,
      ModelFieldValue<bool>? archived,
      ModelFieldValue<String?>? description,
      ModelFieldValue<List<RoleStaff>?>? staff}) {
    return Role._internal(
        id: id,
        name: name == null ? this.name : name.value,
        archived: archived == null ? this.archived : archived.value,
        description: description == null ? this.description : description.value,
        staff: staff == null ? this.staff : staff.value);
  }

  Role.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _archived = json['archived'],
        _description = json['description'],
        _staff = json['staff'] is Map
            ? (json['staff']['items'] is List
                ? (json['staff']['items'] as List)
                    .where((e) => e != null)
                    .map((e) =>
                        RoleStaff.fromJson(new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['staff'] is List
                ? (json['staff'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => RoleStaff.fromJson(
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
        'staff': _staff?.map((RoleStaff? e) => e?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'name': _name,
        'archived': _archived,
        'description': _description,
        'staff': _staff,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<RoleModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<RoleModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final STAFF = amplify_core.QueryField(
      fieldName: "staff",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'RoleStaff'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Role";
    modelSchemaDefinition.pluralName = "Roles";

    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
          authStrategy: amplify_core.AuthStrategy.PRIVATE,
          operations: const [amplify_core.ModelOperation.READ]),
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
      amplify_core.ModelIndex(fields: const ["name"], name: "rolesByName")
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Role.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Role.ARCHIVED,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Role.DESCRIPTION,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Role.STAFF,
        isRequired: false,
        ofModelName: 'RoleStaff',
        associatedKey: RoleStaff.ROLE));

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

class _RoleModelType extends amplify_core.ModelType<Role> {
  const _RoleModelType();

  @override
  Role fromJson(Map<String, dynamic> jsonData) {
    return Role.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Role';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Role] in your schema.
 */
class RoleModelIdentifier implements amplify_core.ModelIdentifier<Role> {
  final String id;

  /** Create an instance of RoleModelIdentifier using [id] the primary key. */
  const RoleModelIdentifier({required this.id});

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
  String toString() => 'RoleModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is RoleModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
