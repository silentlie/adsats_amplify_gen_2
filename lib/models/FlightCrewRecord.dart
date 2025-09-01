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


/** This is an auto generated class representing the FlightCrewRecord type in your schema. */
class FlightCrewRecord extends amplify_core.Model {
  static const classType = const _FlightCrewRecordModelType();
  final String id;
  final String? _name;
  final bool? _archived;
  final FlightCrewRecordCategory? _category;
  final Staff? _staff;
  final amplify_core.TemporalDateTime? _expiredAt;
  final amplify_core.TemporalDateTime? _issuedAt;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  FlightCrewRecordModelIdentifier get modelIdentifier {
      return FlightCrewRecordModelIdentifier(
        id: id
      );
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get archived {
    try {
      return _archived!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  FlightCrewRecordCategory? get category {
    return _category;
  }
  
  Staff? get staff {
    return _staff;
  }
  
  amplify_core.TemporalDateTime? get expiredAt {
    return _expiredAt;
  }
  
  amplify_core.TemporalDateTime? get issuedAt {
    return _issuedAt;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const FlightCrewRecord._internal({required this.id, required name, required archived, category, staff, expiredAt, issuedAt, createdAt, updatedAt}): _name = name, _archived = archived, _category = category, _staff = staff, _expiredAt = expiredAt, _issuedAt = issuedAt, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory FlightCrewRecord({String? id, required String name, required bool archived, FlightCrewRecordCategory? category, Staff? staff, amplify_core.TemporalDateTime? expiredAt, amplify_core.TemporalDateTime? issuedAt}) {
    return FlightCrewRecord._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      name: name,
      archived: archived,
      category: category,
      staff: staff,
      expiredAt: expiredAt,
      issuedAt: issuedAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlightCrewRecord &&
      id == other.id &&
      _name == other._name &&
      _archived == other._archived &&
      _category == other._category &&
      _staff == other._staff &&
      _expiredAt == other._expiredAt &&
      _issuedAt == other._issuedAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("FlightCrewRecord {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("archived=" + (_archived != null ? _archived.toString() : "null") + ", ");
    buffer.write("category=" + (_category != null ? _category.toString() : "null") + ", ");
    buffer.write("staff=" + (_staff != null ? _staff.toString() : "null") + ", ");
    buffer.write("expiredAt=" + (_expiredAt != null ? _expiredAt.format() : "null") + ", ");
    buffer.write("issuedAt=" + (_issuedAt != null ? _issuedAt.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  FlightCrewRecord copyWith({String? name, bool? archived, FlightCrewRecordCategory? category, Staff? staff, amplify_core.TemporalDateTime? expiredAt, amplify_core.TemporalDateTime? issuedAt}) {
    return FlightCrewRecord._internal(
      id: id,
      name: name ?? this.name,
      archived: archived ?? this.archived,
      category: category ?? this.category,
      staff: staff ?? this.staff,
      expiredAt: expiredAt ?? this.expiredAt,
      issuedAt: issuedAt ?? this.issuedAt);
  }
  
  FlightCrewRecord copyWithModelFieldValues({
    ModelFieldValue<String>? name,
    ModelFieldValue<bool>? archived,
    ModelFieldValue<FlightCrewRecordCategory?>? category,
    ModelFieldValue<Staff?>? staff,
    ModelFieldValue<amplify_core.TemporalDateTime?>? expiredAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? issuedAt
  }) {
    return FlightCrewRecord._internal(
      id: id,
      name: name == null ? this.name : name.value,
      archived: archived == null ? this.archived : archived.value,
      category: category == null ? this.category : category.value,
      staff: staff == null ? this.staff : staff.value,
      expiredAt: expiredAt == null ? this.expiredAt : expiredAt.value,
      issuedAt: issuedAt == null ? this.issuedAt : issuedAt.value
    );
  }
  
  FlightCrewRecord.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _archived = json['archived'],
      _category = json['category'] != null
        ? json['category']['serializedData'] != null
          ? FlightCrewRecordCategory.fromJson(new Map<String, dynamic>.from(json['category']['serializedData']))
          : FlightCrewRecordCategory.fromJson(new Map<String, dynamic>.from(json['category']))
        : null,
      _staff = json['staff'] != null
        ? json['staff']['serializedData'] != null
          ? Staff.fromJson(new Map<String, dynamic>.from(json['staff']['serializedData']))
          : Staff.fromJson(new Map<String, dynamic>.from(json['staff']))
        : null,
      _expiredAt = json['expiredAt'] != null ? amplify_core.TemporalDateTime.fromString(json['expiredAt']) : null,
      _issuedAt = json['issuedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['issuedAt']) : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'archived': _archived, 'category': _category?.toJson(), 'staff': _staff?.toJson(), 'expiredAt': _expiredAt?.format(), 'issuedAt': _issuedAt?.format(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'name': _name,
    'archived': _archived,
    'category': _category,
    'staff': _staff,
    'expiredAt': _expiredAt,
    'issuedAt': _issuedAt,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<FlightCrewRecordModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<FlightCrewRecordModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final CATEGORY = amplify_core.QueryField(
    fieldName: "category",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'FlightCrewRecordCategory'));
  static final STAFF = amplify_core.QueryField(
    fieldName: "staff",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Staff'));
  static final EXPIREDAT = amplify_core.QueryField(fieldName: "expiredAt");
  static final ISSUEDAT = amplify_core.QueryField(fieldName: "issuedAt");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "FlightCrewRecord";
    modelSchemaDefinition.pluralName = "FlightCrewRecords";
    
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
      key: FlightCrewRecord.NAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FlightCrewRecord.ARCHIVED,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: FlightCrewRecord.CATEGORY,
      isRequired: false,
      targetNames: ['categoryId'],
      ofModelName: 'FlightCrewRecordCategory'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: FlightCrewRecord.STAFF,
      isRequired: false,
      targetNames: ['staffId'],
      ofModelName: 'Staff'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FlightCrewRecord.EXPIREDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: FlightCrewRecord.ISSUEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _FlightCrewRecordModelType extends amplify_core.ModelType<FlightCrewRecord> {
  const _FlightCrewRecordModelType();
  
  @override
  FlightCrewRecord fromJson(Map<String, dynamic> jsonData) {
    return FlightCrewRecord.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'FlightCrewRecord';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [FlightCrewRecord] in your schema.
 */
class FlightCrewRecordModelIdentifier implements amplify_core.ModelIdentifier<FlightCrewRecord> {
  final String id;

  /** Create an instance of FlightCrewRecordModelIdentifier using [id] the primary key. */
  const FlightCrewRecordModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'FlightCrewRecordModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is FlightCrewRecordModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}