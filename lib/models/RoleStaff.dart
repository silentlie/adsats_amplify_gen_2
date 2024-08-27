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

/** This is an auto generated class representing the RoleStaff type in your schema. */
class RoleStaff extends amplify_core.Model {
  static const classType = const _RoleStaffModelType();
  final String id;
  final Role? _role;
  final Staff? _staff;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  RoleStaffModelIdentifier get modelIdentifier {
    return RoleStaffModelIdentifier(id: id);
  }

  Role? get role {
    return _role;
  }

  Staff? get staff {
    return _staff;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const RoleStaff._internal(
      {required this.id, role, staff, createdAt, updatedAt})
      : _role = role,
        _staff = staff,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory RoleStaff({String? id, Role? role, Staff? staff}) {
    return RoleStaff._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        role: role,
        staff: staff);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RoleStaff &&
        id == other.id &&
        _role == other._role &&
        _staff == other._staff;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("RoleStaff {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("role=" + (_role != null ? _role.toString() : "null") + ", ");
    buffer
        .write("staff=" + (_staff != null ? _staff.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  RoleStaff copyWith({Role? role, Staff? staff}) {
    return RoleStaff._internal(
        id: id, role: role ?? this.role, staff: staff ?? this.staff);
  }

  RoleStaff copyWithModelFieldValues(
      {ModelFieldValue<Role?>? role, ModelFieldValue<Staff?>? staff}) {
    return RoleStaff._internal(
        id: id,
        role: role == null ? this.role : role.value,
        staff: staff == null ? this.staff : staff.value);
  }

  RoleStaff.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _role = json['role'] != null
            ? json['role']['serializedData'] != null
                ? Role.fromJson(new Map<String, dynamic>.from(
                    json['role']['serializedData']))
                : Role.fromJson(new Map<String, dynamic>.from(json['role']))
            : null,
        _staff = json['staff'] != null
            ? json['staff']['serializedData'] != null
                ? Staff.fromJson(new Map<String, dynamic>.from(
                    json['staff']['serializedData']))
                : Staff.fromJson(new Map<String, dynamic>.from(json['staff']))
            : null,
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'role': _role?.toJson(),
        'staff': _staff?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'role': _role,
        'staff': _staff,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<RoleStaffModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<RoleStaffModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ROLE = amplify_core.QueryField(
      fieldName: "role",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Role'));
  static final STAFF = amplify_core.QueryField(
      fieldName: "staff",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Staff'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RoleStaff";
    modelSchemaDefinition.pluralName = "RoleStaffs";

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

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: RoleStaff.ROLE,
        isRequired: false,
        targetNames: ['roleId'],
        ofModelName: 'Role'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: RoleStaff.STAFF,
        isRequired: false,
        targetNames: ['staffId'],
        ofModelName: 'Staff'));

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

class _RoleStaffModelType extends amplify_core.ModelType<RoleStaff> {
  const _RoleStaffModelType();

  @override
  RoleStaff fromJson(Map<String, dynamic> jsonData) {
    return RoleStaff.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'RoleStaff';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [RoleStaff] in your schema.
 */
class RoleStaffModelIdentifier
    implements amplify_core.ModelIdentifier<RoleStaff> {
  final String id;

  /** Create an instance of RoleStaffModelIdentifier using [id] the primary key. */
  const RoleStaffModelIdentifier({required this.id});

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
  String toString() => 'RoleStaffModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is RoleStaffModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
