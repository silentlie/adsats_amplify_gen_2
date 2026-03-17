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

/** This is an auto generated class representing the ReminderStaff type in your schema. */
class ReminderStaff extends amplify_core.Model {
  static const classType = const _ReminderStaffModelType();
  final String? _reminderId;
  final String? _staffId;
  final Reminder? _reminder;
  final Staff? _staff;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();

  ReminderStaffModelIdentifier get modelIdentifier {
    try {
      return ReminderStaffModelIdentifier(
          reminderId: _reminderId!, staffId: _staffId!);
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

  String get staffId {
    try {
      return _staffId!;
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

  Staff? get staff {
    return _staff;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const ReminderStaff._internal(
      {required reminderId,
      required staffId,
      reminder,
      staff,
      createdAt,
      updatedAt})
      : _reminderId = reminderId,
        _staffId = staffId,
        _reminder = reminder,
        _staff = staff,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory ReminderStaff(
      {required String reminderId,
      required String staffId,
      Reminder? reminder,
      Staff? staff}) {
    return ReminderStaff._internal(
        reminderId: reminderId,
        staffId: staffId,
        reminder: reminder,
        staff: staff);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReminderStaff &&
        _reminderId == other._reminderId &&
        _staffId == other._staffId &&
        _reminder == other._reminder &&
        _staff == other._staff;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ReminderStaff {");
    buffer.write("reminderId=" + "$_reminderId" + ", ");
    buffer.write("staffId=" + "$_staffId" + ", ");
    buffer.write("reminder=" +
        (_reminder != null ? _reminder!.toString() : "null") +
        ", ");
    buffer.write(
        "staff=" + (_staff != null ? _staff!.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt!.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  ReminderStaff copyWith({Reminder? reminder, Staff? staff}) {
    return ReminderStaff._internal(
        reminderId: reminderId,
        staffId: staffId,
        reminder: reminder ?? this.reminder,
        staff: staff ?? this.staff);
  }

  ReminderStaff copyWithModelFieldValues(
      {ModelFieldValue<Reminder?>? reminder, ModelFieldValue<Staff?>? staff}) {
    return ReminderStaff._internal(
        reminderId: reminderId,
        staffId: staffId,
        reminder: reminder == null ? this.reminder : reminder.value,
        staff: staff == null ? this.staff : staff.value);
  }

  ReminderStaff.fromJson(Map<String, dynamic> json)
      : _reminderId = json['reminderId'],
        _staffId = json['staffId'],
        _reminder = json['reminder'] != null
            ? json['reminder']['serializedData'] != null
                ? Reminder.fromJson(new Map<String, dynamic>.from(
                    json['reminder']['serializedData']))
                : Reminder.fromJson(
                    new Map<String, dynamic>.from(json['reminder']))
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
        'reminderId': _reminderId,
        'staffId': _staffId,
        'reminder': _reminder?.toJson(),
        'staff': _staff?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'reminderId': _reminderId,
        'staffId': _staffId,
        'reminder': _reminder,
        'staff': _staff,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<ReminderStaffModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<ReminderStaffModelIdentifier>();
  static final REMINDERID = amplify_core.QueryField(fieldName: "reminderId");
  static final STAFFID = amplify_core.QueryField(fieldName: "staffId");
  static final REMINDER = amplify_core.QueryField(
      fieldName: "reminder",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Reminder'));
  static final STAFF = amplify_core.QueryField(
      fieldName: "staff",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Staff'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ReminderStaff";
    modelSchemaDefinition.pluralName = "ReminderStaffs";

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
          fields: const ["reminderId", "staffId"], name: null)
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: ReminderStaff.REMINDERID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: ReminderStaff.STAFFID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: ReminderStaff.REMINDER,
        isRequired: false,
        targetNames: ['reminderId'],
        ofModelName: 'Reminder'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: ReminderStaff.STAFF,
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

class _ReminderStaffModelType extends amplify_core.ModelType<ReminderStaff> {
  const _ReminderStaffModelType();

  @override
  ReminderStaff fromJson(Map<String, dynamic> jsonData) {
    return ReminderStaff.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'ReminderStaff';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ReminderStaff] in your schema.
 */
class ReminderStaffModelIdentifier
    implements amplify_core.ModelIdentifier<ReminderStaff> {
  final String reminderId;
  final String staffId;

  /**
   * Create an instance of ReminderStaffModelIdentifier using [reminderId] the primary key.
   * And [staffId] the sort key.
   */
  const ReminderStaffModelIdentifier(
      {required this.reminderId, required this.staffId});

  @override
  Map<String, dynamic> serializeAsMap() =>
      (<String, dynamic>{'reminderId': reminderId, 'staffId': staffId});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() =>
      'ReminderStaffModelIdentifier(reminderId: $reminderId, staffId: $staffId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ReminderStaffModelIdentifier &&
        reminderId == other.reminderId &&
        staffId == other.staffId;
  }

  @override
  int get hashCode => reminderId.hashCode ^ staffId.hashCode;
}
