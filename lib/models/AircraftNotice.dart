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

/** This is an auto generated class representing the AircraftNotice type in your schema. */
class AircraftNotice extends amplify_core.Model {
  static const classType = const _AircraftNoticeModelType();
  final String id;
  final Aircraft? _aircraft;
  final Notice? _notice;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  AircraftNoticeModelIdentifier get modelIdentifier {
    return AircraftNoticeModelIdentifier(id: id);
  }

  Aircraft? get aircraft {
    return _aircraft;
  }

  Notice? get notice {
    return _notice;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const AircraftNotice._internal(
      {required this.id, aircraft, notice, createdAt, updatedAt})
      : _aircraft = aircraft,
        _notice = notice,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory AircraftNotice({String? id, Aircraft? aircraft, Notice? notice}) {
    return AircraftNotice._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        aircraft: aircraft,
        notice: notice);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AircraftNotice &&
        id == other.id &&
        _aircraft == other._aircraft &&
        _notice == other._notice;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("AircraftNotice {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("aircraft=" +
        (_aircraft != null ? _aircraft.toString() : "null") +
        ", ");
    buffer.write(
        "notice=" + (_notice != null ? _notice.toString() : "null") + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  AircraftNotice copyWith({Aircraft? aircraft, Notice? notice}) {
    return AircraftNotice._internal(
        id: id,
        aircraft: aircraft ?? this.aircraft,
        notice: notice ?? this.notice);
  }

  AircraftNotice copyWithModelFieldValues(
      {ModelFieldValue<Aircraft?>? aircraft,
      ModelFieldValue<Notice?>? notice}) {
    return AircraftNotice._internal(
        id: id,
        aircraft: aircraft == null ? this.aircraft : aircraft.value,
        notice: notice == null ? this.notice : notice.value);
  }

  AircraftNotice.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _aircraft = json['aircraft'] != null
            ? json['aircraft']['serializedData'] != null
                ? Aircraft.fromJson(new Map<String, dynamic>.from(
                    json['aircraft']['serializedData']))
                : Aircraft.fromJson(
                    new Map<String, dynamic>.from(json['aircraft']))
            : null,
        _notice = json['notice'] != null
            ? json['notice']['serializedData'] != null
                ? Notice.fromJson(new Map<String, dynamic>.from(
                    json['notice']['serializedData']))
                : Notice.fromJson(new Map<String, dynamic>.from(json['notice']))
            : null,
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'aircraft': _aircraft?.toJson(),
        'notice': _notice?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'aircraft': _aircraft,
        'notice': _notice,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<AircraftNoticeModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<AircraftNoticeModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final AIRCRAFT = amplify_core.QueryField(
      fieldName: "aircraft",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Aircraft'));
  static final NOTICE = amplify_core.QueryField(
      fieldName: "notice",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Notice'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AircraftNotice";
    modelSchemaDefinition.pluralName = "AircraftNotices";

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

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: AircraftNotice.AIRCRAFT,
        isRequired: false,
        targetNames: ['aircraftId'],
        ofModelName: 'Aircraft'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: AircraftNotice.NOTICE,
        isRequired: false,
        targetNames: ['noticeId'],
        ofModelName: 'Notice'));

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

class _AircraftNoticeModelType extends amplify_core.ModelType<AircraftNotice> {
  const _AircraftNoticeModelType();

  @override
  AircraftNotice fromJson(Map<String, dynamic> jsonData) {
    return AircraftNotice.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'AircraftNotice';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [AircraftNotice] in your schema.
 */
class AircraftNoticeModelIdentifier
    implements amplify_core.ModelIdentifier<AircraftNotice> {
  final String id;

  /** Create an instance of AircraftNoticeModelIdentifier using [id] the primary key. */
  const AircraftNoticeModelIdentifier({required this.id});

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
  String toString() => 'AircraftNoticeModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is AircraftNoticeModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
