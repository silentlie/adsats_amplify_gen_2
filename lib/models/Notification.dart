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

/** This is an auto generated class representing the Notification type in your schema. */
class Notification extends amplify_core.Model {
  static const classType = const _NotificationModelType();
  final String id;
  final amplify_core.TemporalDateTime? _read_at;
  final Notice? _notice;
  final Staff? _staff;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  NotificationModelIdentifier get modelIdentifier {
    return NotificationModelIdentifier(id: id);
  }

  amplify_core.TemporalDateTime? get read_at {
    return _read_at;
  }

  Notice? get notice {
    return _notice;
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

  const Notification._internal(
      {required this.id, read_at, notice, staff, createdAt, updatedAt})
      : _read_at = read_at,
        _notice = notice,
        _staff = staff,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Notification(
      {String? id,
      amplify_core.TemporalDateTime? read_at,
      Notice? notice,
      Staff? staff}) {
    return Notification._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        read_at: read_at,
        notice: notice,
        staff: staff);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Notification &&
        id == other.id &&
        _read_at == other._read_at &&
        _notice == other._notice &&
        _staff == other._staff;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Notification {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write(
        "read_at=" + (_read_at != null ? _read_at.format() : "null") + ", ");
    buffer.write(
        "notice=" + (_notice != null ? _notice.toString() : "null") + ", ");
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

  Notification copyWith(
      {amplify_core.TemporalDateTime? read_at, Notice? notice, Staff? staff}) {
    return Notification._internal(
        id: id,
        read_at: read_at ?? this.read_at,
        notice: notice ?? this.notice,
        staff: staff ?? this.staff);
  }

  Notification copyWithModelFieldValues(
      {ModelFieldValue<amplify_core.TemporalDateTime?>? read_at,
      ModelFieldValue<Notice?>? notice,
      ModelFieldValue<Staff?>? staff}) {
    return Notification._internal(
        id: id,
        read_at: read_at == null ? this.read_at : read_at.value,
        notice: notice == null ? this.notice : notice.value,
        staff: staff == null ? this.staff : staff.value);
  }

  Notification.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _read_at = json['read_at'] != null
            ? amplify_core.TemporalDateTime.fromString(json['read_at'])
            : null,
        _notice = json['notice'] != null
            ? json['notice']['serializedData'] != null
                ? Notice.fromJson(new Map<String, dynamic>.from(
                    json['notice']['serializedData']))
                : Notice.fromJson(new Map<String, dynamic>.from(json['notice']))
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
        'read_at': _read_at?.format(),
        'notice': _notice?.toJson(),
        'staff': _staff?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'read_at': _read_at,
        'notice': _notice,
        'staff': _staff,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<NotificationModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<NotificationModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final READ_AT = amplify_core.QueryField(fieldName: "read_at");
  static final NOTICE = amplify_core.QueryField(
      fieldName: "notice",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Notice'));
  static final STAFF = amplify_core.QueryField(
      fieldName: "staff",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Staff'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Notification";
    modelSchemaDefinition.pluralName = "Notifications";

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

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Notification.READ_AT,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Notification.NOTICE,
        isRequired: false,
        targetNames: ['noticeId'],
        ofModelName: 'Notice'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Notification.STAFF,
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

class _NotificationModelType extends amplify_core.ModelType<Notification> {
  const _NotificationModelType();

  @override
  Notification fromJson(Map<String, dynamic> jsonData) {
    return Notification.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Notification';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Notification] in your schema.
 */
class NotificationModelIdentifier
    implements amplify_core.ModelIdentifier<Notification> {
  final String id;

  /** Create an instance of NotificationModelIdentifier using [id] the primary key. */
  const NotificationModelIdentifier({required this.id});

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
  String toString() => 'NotificationModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NotificationModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
