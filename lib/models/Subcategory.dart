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

/** This is an auto generated class representing the Subcategory type in your schema. */
class Subcategory extends amplify_core.Model {
  static const classType = const _SubcategoryModelType();
  final String id;
  final String? _name;
  final bool? _archived;
  final String? _description;
  final Category? _category;
  final List<Document>? _documents;
  final List<StaffSubcategory>? _staff;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  SubcategoryModelIdentifier get modelIdentifier {
    return SubcategoryModelIdentifier(id: id);
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

  Category? get category {
    return _category;
  }

  List<Document>? get documents {
    return _documents;
  }

  List<StaffSubcategory>? get staff {
    return _staff;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Subcategory._internal(
      {required this.id,
      required name,
      required archived,
      description,
      category,
      documents,
      staff,
      createdAt,
      updatedAt})
      : _name = name,
        _archived = archived,
        _description = description,
        _category = category,
        _documents = documents,
        _staff = staff,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Subcategory(
      {String? id,
      required String name,
      required bool archived,
      String? description,
      Category? category,
      List<Document>? documents,
      List<StaffSubcategory>? staff}) {
    return Subcategory._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        name: name,
        archived: archived,
        description: description,
        category: category,
        documents: documents != null
            ? List<Document>.unmodifiable(documents)
            : documents,
        staff:
            staff != null ? List<StaffSubcategory>.unmodifiable(staff) : staff);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Subcategory &&
        id == other.id &&
        _name == other._name &&
        _archived == other._archived &&
        _description == other._description &&
        _category == other._category &&
        DeepCollectionEquality().equals(_documents, other._documents) &&
        DeepCollectionEquality().equals(_staff, other._staff);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Subcategory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("archived=" +
        (_archived != null ? _archived.toString() : "null") +
        ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("category=" +
        (_category != null ? _category.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Subcategory copyWith(
      {String? name,
      bool? archived,
      String? description,
      Category? category,
      List<Document>? documents,
      List<StaffSubcategory>? staff}) {
    return Subcategory._internal(
        id: id,
        name: name ?? this.name,
        archived: archived ?? this.archived,
        description: description ?? this.description,
        category: category ?? this.category,
        documents: documents ?? this.documents,
        staff: staff ?? this.staff);
  }

  Subcategory copyWithModelFieldValues(
      {ModelFieldValue<String>? name,
      ModelFieldValue<bool>? archived,
      ModelFieldValue<String?>? description,
      ModelFieldValue<Category?>? category,
      ModelFieldValue<List<Document>?>? documents,
      ModelFieldValue<List<StaffSubcategory>?>? staff}) {
    return Subcategory._internal(
        id: id,
        name: name == null ? this.name : name.value,
        archived: archived == null ? this.archived : archived.value,
        description: description == null ? this.description : description.value,
        category: category == null ? this.category : category.value,
        documents: documents == null ? this.documents : documents.value,
        staff: staff == null ? this.staff : staff.value);
  }

  Subcategory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _archived = json['archived'],
        _description = json['description'],
        _category = json['category'] != null
            ? json['category']['serializedData'] != null
                ? Category.fromJson(new Map<String, dynamic>.from(
                    json['category']['serializedData']))
                : Category.fromJson(
                    new Map<String, dynamic>.from(json['category']))
            : null,
        _documents = json['documents'] is Map
            ? (json['documents']['items'] is List
                ? (json['documents']['items'] as List)
                    .where((e) => e != null)
                    .map((e) =>
                        Document.fromJson(new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['documents'] is List
                ? (json['documents'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => Document.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _staff = json['staff'] is Map
            ? (json['staff']['items'] is List
                ? (json['staff']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => StaffSubcategory.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['staff'] is List
                ? (json['staff'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => StaffSubcategory.fromJson(
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
        'category': _category?.toJson(),
        'documents': _documents?.map((Document? e) => e?.toJson()).toList(),
        'staff': _staff?.map((StaffSubcategory? e) => e?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'name': _name,
        'archived': _archived,
        'description': _description,
        'category': _category,
        'documents': _documents,
        'staff': _staff,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<SubcategoryModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<SubcategoryModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final CATEGORY = amplify_core.QueryField(
      fieldName: "category",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Category'));
  static final DOCUMENTS = amplify_core.QueryField(
      fieldName: "documents",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Document'));
  static final STAFF = amplify_core.QueryField(
      fieldName: "staff",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'StaffSubcategory'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Subcategory";
    modelSchemaDefinition.pluralName = "Subcategories";

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
        key: Subcategory.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Subcategory.ARCHIVED,
        isRequired: true,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Subcategory.DESCRIPTION,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Subcategory.CATEGORY,
        isRequired: false,
        targetNames: ['categoryId'],
        ofModelName: 'Category'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Subcategory.DOCUMENTS,
        isRequired: false,
        ofModelName: 'Document',
        associatedKey: Document.SUBCATEGORY));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Subcategory.STAFF,
        isRequired: false,
        ofModelName: 'StaffSubcategory',
        associatedKey: StaffSubcategory.SUBCATEGORY));

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

class _SubcategoryModelType extends amplify_core.ModelType<Subcategory> {
  const _SubcategoryModelType();

  @override
  Subcategory fromJson(Map<String, dynamic> jsonData) {
    return Subcategory.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Subcategory';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Subcategory] in your schema.
 */
class SubcategoryModelIdentifier
    implements amplify_core.ModelIdentifier<Subcategory> {
  final String id;

  /** Create an instance of SubcategoryModelIdentifier using [id] the primary key. */
  const SubcategoryModelIdentifier({required this.id});

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
  String toString() => 'SubcategoryModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is SubcategoryModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
