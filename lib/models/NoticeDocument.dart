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

/** This is an auto generated class representing the NoticeDocument type in your schema. */
class NoticeDocument extends amplify_core.Model {
  static const classType = const _NoticeDocumentModelType();
  final String id;
  final Notice? _notices;
  final String? _name;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  NoticeDocumentModelIdentifier get modelIdentifier {
    return NoticeDocumentModelIdentifier(id: id);
  }

  Notice? get notices {
    return _notices;
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

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const NoticeDocument._internal(
      {required this.id, notices, required name, createdAt, updatedAt})
      : _notices = notices,
        _name = name,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory NoticeDocument({String? id, Notice? notices, required String name}) {
    return NoticeDocument._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        notices: notices,
        name: name);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NoticeDocument &&
        id == other.id &&
        _notices == other._notices &&
        _name == other._name;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("NoticeDocument {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write(
        "notices=" + (_notices != null ? _notices.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  NoticeDocument copyWith({Notice? notices, String? name}) {
    return NoticeDocument._internal(
        id: id, notices: notices ?? this.notices, name: name ?? this.name);
  }

  NoticeDocument copyWithModelFieldValues(
      {ModelFieldValue<Notice?>? notices, ModelFieldValue<String>? name}) {
    return NoticeDocument._internal(
        id: id,
        notices: notices == null ? this.notices : notices.value,
        name: name == null ? this.name : name.value);
  }

  NoticeDocument.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _notices = json['notices'] != null
            ? json['notices']['serializedData'] != null
                ? Notice.fromJson(new Map<String, dynamic>.from(
                    json['notices']['serializedData']))
                : Notice.fromJson(
                    new Map<String, dynamic>.from(json['notices']))
            : null,
        _name = json['name'],
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'notices': _notices?.toJson(),
        'name': _name,
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'notices': _notices,
        'name': _name,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<NoticeDocumentModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<NoticeDocumentModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NOTICES = amplify_core.QueryField(
      fieldName: "notices",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Notice'));
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "NoticeDocument";
    modelSchemaDefinition.pluralName = "NoticeDocuments";

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
        key: NoticeDocument.NOTICES,
        isRequired: false,
        targetNames: ['noticeId'],
        ofModelName: 'Notice'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: NoticeDocument.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

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

class _NoticeDocumentModelType extends amplify_core.ModelType<NoticeDocument> {
  const _NoticeDocumentModelType();

  @override
  NoticeDocument fromJson(Map<String, dynamic> jsonData) {
    return NoticeDocument.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'NoticeDocument';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [NoticeDocument] in your schema.
 */
class NoticeDocumentModelIdentifier
    implements amplify_core.ModelIdentifier<NoticeDocument> {
  final String id;

  /** Create an instance of NoticeDocumentModelIdentifier using [id] the primary key. */
  const NoticeDocumentModelIdentifier({required this.id});

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
  String toString() => 'NoticeDocumentModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NoticeDocumentModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
