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

/** This is an auto generated class representing the Category type in your schema. */
class Category extends amplify_core.Model {
  static const classType = const _CategoryModelType();
  final String id;
  final String? _name;
  final bool? _archived;
  final String? _description;
  final List<Subcategory>? _subcategories;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  CategoryModelIdentifier get modelIdentifier {
    return CategoryModelIdentifier(id: id);
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

  List<Subcategory>? get subcategories {
    return _subcategories;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Category._internal(
      {required this.id,
      required name,
      required archived,
      description,
      subcategories,
      createdAt,
      updatedAt})
      : _name = name,
        _archived = archived,
        _description = description,
        _subcategories = subcategories,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Category(
      {String? id,
      required String name,
      required bool archived,
      String? description,
      List<Subcategory>? subcategories}) {
    return Category._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        name: name,
        archived: archived,
        description: description,
        subcategories: subcategories != null
            ? List<Subcategory>.unmodifiable(subcategories)
            : subcategories);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Category &&
        id == other.id &&
        _name == other._name &&
        _archived == other._archived &&
        _description == other._description &&
        DeepCollectionEquality().equals(_subcategories, other._subcategories);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Category {");
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

  Category copyWith(
      {String? name,
      bool? archived,
      String? description,
      List<Subcategory>? subcategories}) {
    return Category._internal(
        id: id,
        name: name ?? this.name,
        archived: archived ?? this.archived,
        description: description ?? this.description,
        subcategories: subcategories ?? this.subcategories);
  }

  Category copyWithModelFieldValues(
      {ModelFieldValue<String>? name,
      ModelFieldValue<bool>? archived,
      ModelFieldValue<String?>? description,
      ModelFieldValue<List<Subcategory>?>? subcategories}) {
    return Category._internal(
        id: id,
        name: name == null ? this.name : name.value,
        archived: archived == null ? this.archived : archived.value,
        description: description == null ? this.description : description.value,
        subcategories:
            subcategories == null ? this.subcategories : subcategories.value);
  }

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _archived = json['archived'],
        _description = json['description'],
        _subcategories = json['subcategories'] is Map
            ? (json['subcategories']['items'] is List
                ? (json['subcategories']['items'] as List)
                    .where((e) => e != null)
                    .map((e) =>
                        Subcategory.fromJson(new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['subcategories'] is List
                ? (json['subcategories'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => Subcategory.fromJson(
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
        'subcategories':
            _subcategories?.map((Subcategory? e) => e?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'name': _name,
        'archived': _archived,
        'description': _description,
        'subcategories': _subcategories,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<CategoryModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<CategoryModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final SUBCATEGORIES = amplify_core.QueryField(
      fieldName: "subcategories",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Subcategory'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Category";
    modelSchemaDefinition.pluralName = "Categories";

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
      amplify_core.ModelIndex(fields: const ["name"], name: "categoriesByName")
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Category.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Category.ARCHIVED,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Category.DESCRIPTION,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Category.SUBCATEGORIES,
        isRequired: false,
        ofModelName: 'Subcategory',
        associatedKey: Subcategory.CATEGORY));

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

class _CategoryModelType extends amplify_core.ModelType<Category> {
  const _CategoryModelType();

  @override
  Category fromJson(Map<String, dynamic> jsonData) {
    return Category.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Category';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Category] in your schema.
 */
class CategoryModelIdentifier
    implements amplify_core.ModelIdentifier<Category> {
  final String id;

  /** Create an instance of CategoryModelIdentifier using [id] the primary key. */
  const CategoryModelIdentifier({required this.id});

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
  String toString() => 'CategoryModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is CategoryModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
