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

/** This is an auto generated class representing the Document type in your schema. */
class Document extends amplify_core.Model {
  static const classType = const _DocumentModelType();
  final String id;
  final String? _name;
  final bool? _archived;
  final Subcategory? _subcategory;
  final Staff? _staff;
  final List<AircraftDocument>? _aircraft;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  DocumentModelIdentifier get modelIdentifier {
    return DocumentModelIdentifier(id: id);
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

  Subcategory? get subcategory {
    return _subcategory;
  }

  Staff? get staff {
    return _staff;
  }

  List<AircraftDocument>? get aircraft {
    return _aircraft;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Document._internal(
      {required this.id,
      required name,
      required archived,
      subcategory,
      staff,
      aircraft,
      createdAt,
      updatedAt})
      : _name = name,
        _archived = archived,
        _subcategory = subcategory,
        _staff = staff,
        _aircraft = aircraft,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Document(
      {String? id,
      required String name,
      required bool archived,
      Subcategory? subcategory,
      Staff? staff,
      List<AircraftDocument>? aircraft}) {
    return Document._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        name: name,
        archived: archived,
        subcategory: subcategory,
        staff: staff,
        aircraft: aircraft != null
            ? List<AircraftDocument>.unmodifiable(aircraft)
            : aircraft);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Document &&
        id == other.id &&
        _name == other._name &&
        _archived == other._archived &&
        _subcategory == other._subcategory &&
        _staff == other._staff &&
        DeepCollectionEquality().equals(_aircraft, other._aircraft);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Document {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("archived=" +
        (_archived != null ? _archived.toString() : "null") +
        ", ");
    buffer.write("subcategory=" +
        (_subcategory != null ? _subcategory.toString() : "null") +
        ", ");
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

  Document copyWith(
      {String? name,
      bool? archived,
      Subcategory? subcategory,
      Staff? staff,
      List<AircraftDocument>? aircraft}) {
    return Document._internal(
        id: id,
        name: name ?? this.name,
        archived: archived ?? this.archived,
        subcategory: subcategory ?? this.subcategory,
        staff: staff ?? this.staff,
        aircraft: aircraft ?? this.aircraft);
  }

  Document copyWithModelFieldValues(
      {ModelFieldValue<String>? name,
      ModelFieldValue<bool>? archived,
      ModelFieldValue<Subcategory?>? subcategory,
      ModelFieldValue<Staff?>? staff,
      ModelFieldValue<List<AircraftDocument>?>? aircraft}) {
    return Document._internal(
        id: id,
        name: name == null ? this.name : name.value,
        archived: archived == null ? this.archived : archived.value,
        subcategory: subcategory == null ? this.subcategory : subcategory.value,
        staff: staff == null ? this.staff : staff.value,
        aircraft: aircraft == null ? this.aircraft : aircraft.value);
  }

  Document.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _archived = json['archived'],
        _subcategory = json['subcategory'] != null
            ? json['subcategory']['serializedData'] != null
                ? Subcategory.fromJson(new Map<String, dynamic>.from(
                    json['subcategory']['serializedData']))
                : Subcategory.fromJson(
                    new Map<String, dynamic>.from(json['subcategory']))
            : null,
        _staff = json['staff'] != null
            ? json['staff']['serializedData'] != null
                ? Staff.fromJson(new Map<String, dynamic>.from(
                    json['staff']['serializedData']))
                : Staff.fromJson(new Map<String, dynamic>.from(json['staff']))
            : null,
        _aircraft = json['aircraft'] is Map
            ? (json['aircraft']['items'] is List
                ? (json['aircraft']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => AircraftDocument.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['aircraft'] is List
                ? (json['aircraft'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => AircraftDocument.fromJson(
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
        'subcategory': _subcategory?.toJson(),
        'staff': _staff?.toJson(),
        'aircraft':
            _aircraft?.map((AircraftDocument? e) => e?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'name': _name,
        'archived': _archived,
        'subcategory': _subcategory,
        'staff': _staff,
        'aircraft': _aircraft,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<DocumentModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<DocumentModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final SUBCATEGORY = amplify_core.QueryField(
      fieldName: "subcategory",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Subcategory'));
  static final STAFF = amplify_core.QueryField(
      fieldName: "staff",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Staff'));
  static final AIRCRAFT = amplify_core.QueryField(
      fieldName: "aircraft",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'AircraftDocument'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Document";
    modelSchemaDefinition.pluralName = "Documents";

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

    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["name"], name: "documentsByName")
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Document.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Document.ARCHIVED,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Document.SUBCATEGORY,
        isRequired: false,
        targetNames: ['subcategoryId'],
        ofModelName: 'Subcategory'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Document.STAFF,
        isRequired: false,
        targetNames: ['staffId'],
        ofModelName: 'Staff'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Document.AIRCRAFT,
        isRequired: false,
        ofModelName: 'AircraftDocument',
        associatedKey: AircraftDocument.DOCUMENT));

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

class _DocumentModelType extends amplify_core.ModelType<Document> {
  const _DocumentModelType();

  @override
  Document fromJson(Map<String, dynamic> jsonData) {
    return Document.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Document';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Document] in your schema.
 */
class DocumentModelIdentifier
    implements amplify_core.ModelIdentifier<Document> {
  final String id;

  /** Create an instance of DocumentModelIdentifier using [id] the primary key. */
  const DocumentModelIdentifier({required this.id});

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
  String toString() => 'DocumentModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is DocumentModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
