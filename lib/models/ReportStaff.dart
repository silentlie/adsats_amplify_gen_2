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

/** This is an auto generated class representing the ReportStaff type in your schema. */
class ReportStaff extends amplify_core.Model {
  static const classType = const _ReportStaffModelType();
  final String id;
  final bool? _isRead;
  final amplify_core.TemporalDateTime? _readAt;
  final Report? _report;
  final Staff? _staff;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  ReportStaffModelIdentifier get modelIdentifier {
    return ReportStaffModelIdentifier(id: id);
  }

  bool get isRead {
    try {
      return _isRead!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  amplify_core.TemporalDateTime? get readAt {
    return _readAt;
  }

  Report? get report {
    return _report;
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

  const ReportStaff._internal(
      {required this.id,
      required isRead,
      readAt,
      report,
      staff,
      createdAt,
      updatedAt})
      : _isRead = isRead,
        _readAt = readAt,
        _report = report,
        _staff = staff,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory ReportStaff(
      {String? id,
      required bool isRead,
      amplify_core.TemporalDateTime? readAt,
      Report? report,
      Staff? staff}) {
    return ReportStaff._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        isRead: isRead,
        readAt: readAt,
        report: report,
        staff: staff);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportStaff &&
        id == other.id &&
        _isRead == other._isRead &&
        _readAt == other._readAt &&
        _report == other._report &&
        _staff == other._staff;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ReportStaff {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write(
        "isRead=" + (_isRead != null ? _isRead!.toString() : "null") + ", ");
    buffer.write(
        "readAt=" + (_readAt != null ? _readAt!.format() : "null") + ", ");
    buffer.write(
        "report=" + (_report != null ? _report!.toString() : "null") + ", ");
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

  ReportStaff copyWith(
      {bool? isRead,
      amplify_core.TemporalDateTime? readAt,
      Report? report,
      Staff? staff}) {
    return ReportStaff._internal(
        id: id,
        isRead: isRead ?? this.isRead,
        readAt: readAt ?? this.readAt,
        report: report ?? this.report,
        staff: staff ?? this.staff);
  }

  ReportStaff copyWithModelFieldValues(
      {ModelFieldValue<bool>? isRead,
      ModelFieldValue<amplify_core.TemporalDateTime?>? readAt,
      ModelFieldValue<Report?>? report,
      ModelFieldValue<Staff?>? staff}) {
    return ReportStaff._internal(
        id: id,
        isRead: isRead == null ? this.isRead : isRead.value,
        readAt: readAt == null ? this.readAt : readAt.value,
        report: report == null ? this.report : report.value,
        staff: staff == null ? this.staff : staff.value);
  }

  ReportStaff.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _isRead = json['isRead'],
        _readAt = json['readAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['readAt'])
            : null,
        _report = json['report'] != null
            ? json['report']['serializedData'] != null
                ? Report.fromJson(new Map<String, dynamic>.from(
                    json['report']['serializedData']))
                : Report.fromJson(new Map<String, dynamic>.from(json['report']))
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
        'isRead': _isRead,
        'readAt': _readAt?.format(),
        'report': _report?.toJson(),
        'staff': _staff?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'isRead': _isRead,
        'readAt': _readAt,
        'report': _report,
        'staff': _staff,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<ReportStaffModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<ReportStaffModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final ISREAD = amplify_core.QueryField(fieldName: "isRead");
  static final READAT = amplify_core.QueryField(fieldName: "readAt");
  static final REPORT = amplify_core.QueryField(
      fieldName: "report",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Report'));
  static final STAFF = amplify_core.QueryField(
      fieldName: "staff",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Staff'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ReportStaff";
    modelSchemaDefinition.pluralName = "ReportStaffs";

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
        key: ReportStaff.ISREAD,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: ReportStaff.READAT,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: ReportStaff.REPORT,
        isRequired: false,
        targetNames: ['reportId'],
        ofModelName: 'Report'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: ReportStaff.STAFF,
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

class _ReportStaffModelType extends amplify_core.ModelType<ReportStaff> {
  const _ReportStaffModelType();

  @override
  ReportStaff fromJson(Map<String, dynamic> jsonData) {
    return ReportStaff.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'ReportStaff';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [ReportStaff] in your schema.
 */
class ReportStaffModelIdentifier
    implements amplify_core.ModelIdentifier<ReportStaff> {
  final String id;

  /** Create an instance of ReportStaffModelIdentifier using [id] the primary key. */
  const ReportStaffModelIdentifier({required this.id});

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
  String toString() => 'ReportStaffModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ReportStaffModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
