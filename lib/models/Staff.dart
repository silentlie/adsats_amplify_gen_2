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

/** This is an auto generated class representing the Staff type in your schema. */
class Staff extends amplify_core.Model {
  static const classType = const _StaffModelType();
  final String id;
  final String? _name;
  final String? _email;
  final bool? _archived;
  final List<Document>? _documents;
  final List<Notice>? _notices;
  final List<Notification>? _notifications;
  final List<AircraftStaff>? _aircraft;
  final List<RoleStaff>? _roles;
  final List<StaffSubcategory>? _subcategories;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;

  StaffModelIdentifier get modelIdentifier {
    return StaffModelIdentifier(id: id);
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

  String get email {
    try {
      return _email!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  bool? get archived {
    return _archived;
  }

  List<Document>? get documents {
    return _documents;
  }

  List<Notice>? get notices {
    return _notices;
  }

  List<Notification>? get notifications {
    return _notifications;
  }

  List<AircraftStaff>? get aircraft {
    return _aircraft;
  }

  List<RoleStaff>? get roles {
    return _roles;
  }

  List<StaffSubcategory>? get subcategories {
    return _subcategories;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Staff._internal(
      {required this.id,
      required name,
      required email,
      archived,
      documents,
      notices,
      notifications,
      aircraft,
      roles,
      subcategories,
      createdAt,
      updatedAt})
      : _name = name,
        _email = email,
        _archived = archived,
        _documents = documents,
        _notices = notices,
        _notifications = notifications,
        _aircraft = aircraft,
        _roles = roles,
        _subcategories = subcategories,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Staff(
      {String? id,
      required String name,
      required String email,
      bool? archived,
      List<Document>? documents,
      List<Notice>? notices,
      List<Notification>? notifications,
      List<AircraftStaff>? aircraft,
      List<RoleStaff>? roles,
      List<StaffSubcategory>? subcategories}) {
    return Staff._internal(
        id: id == null ? amplify_core.UUID.getUUID() : id,
        name: name,
        email: email,
        archived: archived,
        documents: documents != null
            ? List<Document>.unmodifiable(documents)
            : documents,
        notices: notices != null ? List<Notice>.unmodifiable(notices) : notices,
        notifications: notifications != null
            ? List<Notification>.unmodifiable(notifications)
            : notifications,
        aircraft: aircraft != null
            ? List<AircraftStaff>.unmodifiable(aircraft)
            : aircraft,
        roles: roles != null ? List<RoleStaff>.unmodifiable(roles) : roles,
        subcategories: subcategories != null
            ? List<StaffSubcategory>.unmodifiable(subcategories)
            : subcategories);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Staff &&
        id == other.id &&
        _name == other._name &&
        _email == other._email &&
        _archived == other._archived &&
        DeepCollectionEquality().equals(_documents, other._documents) &&
        DeepCollectionEquality().equals(_notices, other._notices) &&
        DeepCollectionEquality().equals(_notifications, other._notifications) &&
        DeepCollectionEquality().equals(_aircraft, other._aircraft) &&
        DeepCollectionEquality().equals(_roles, other._roles) &&
        DeepCollectionEquality().equals(_subcategories, other._subcategories);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Staff {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("archived=" +
        (_archived != null ? _archived.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Staff copyWith(
      {String? name,
      String? email,
      bool? archived,
      List<Document>? documents,
      List<Notice>? notices,
      List<Notification>? notifications,
      List<AircraftStaff>? aircraft,
      List<RoleStaff>? roles,
      List<StaffSubcategory>? subcategories}) {
    return Staff._internal(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        archived: archived ?? this.archived,
        documents: documents ?? this.documents,
        notices: notices ?? this.notices,
        notifications: notifications ?? this.notifications,
        aircraft: aircraft ?? this.aircraft,
        roles: roles ?? this.roles,
        subcategories: subcategories ?? this.subcategories);
  }

  Staff copyWithModelFieldValues(
      {ModelFieldValue<String>? name,
      ModelFieldValue<String>? email,
      ModelFieldValue<bool?>? archived,
      ModelFieldValue<List<Document>?>? documents,
      ModelFieldValue<List<Notice>?>? notices,
      ModelFieldValue<List<Notification>?>? notifications,
      ModelFieldValue<List<AircraftStaff>?>? aircraft,
      ModelFieldValue<List<RoleStaff>?>? roles,
      ModelFieldValue<List<StaffSubcategory>?>? subcategories}) {
    return Staff._internal(
        id: id,
        name: name == null ? this.name : name.value,
        email: email == null ? this.email : email.value,
        archived: archived == null ? this.archived : archived.value,
        documents: documents == null ? this.documents : documents.value,
        notices: notices == null ? this.notices : notices.value,
        notifications:
            notifications == null ? this.notifications : notifications.value,
        aircraft: aircraft == null ? this.aircraft : aircraft.value,
        roles: roles == null ? this.roles : roles.value,
        subcategories:
            subcategories == null ? this.subcategories : subcategories.value);
  }

  Staff.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _email = json['email'],
        _archived = json['archived'],
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
        _notices = json['notices'] is Map
            ? (json['notices']['items'] is List
                ? (json['notices']['items'] as List)
                    .where((e) => e != null)
                    .map((e) =>
                        Notice.fromJson(new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['notices'] is List
                ? (json['notices'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => Notice.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _notifications = json['notifications'] is Map
            ? (json['notifications']['items'] is List
                ? (json['notifications']['items'] as List)
                    .where((e) => e != null)
                    .map((e) =>
                        Notification.fromJson(new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['notifications'] is List
                ? (json['notifications'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => Notification.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _aircraft = json['aircraft'] is Map
            ? (json['aircraft']['items'] is List
                ? (json['aircraft']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => AircraftStaff.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['aircraft'] is List
                ? (json['aircraft'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => AircraftStaff.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _roles = json['roles'] is Map
            ? (json['roles']['items'] is List
                ? (json['roles']['items'] as List)
                    .where((e) => e != null)
                    .map((e) =>
                        RoleStaff.fromJson(new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['roles'] is List
                ? (json['roles'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => RoleStaff.fromJson(
                        new Map<String, dynamic>.from(e?['serializedData'])))
                    .toList()
                : null),
        _subcategories = json['subcategories'] is Map
            ? (json['subcategories']['items'] is List
                ? (json['subcategories']['items'] as List)
                    .where((e) => e != null)
                    .map((e) => StaffSubcategory.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null)
            : (json['subcategories'] is List
                ? (json['subcategories'] as List)
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
        'email': _email,
        'archived': _archived,
        'documents': _documents?.map((Document? e) => e?.toJson()).toList(),
        'notices': _notices?.map((Notice? e) => e?.toJson()).toList(),
        'notifications':
            _notifications?.map((Notification? e) => e?.toJson()).toList(),
        'aircraft': _aircraft?.map((AircraftStaff? e) => e?.toJson()).toList(),
        'roles': _roles?.map((RoleStaff? e) => e?.toJson()).toList(),
        'subcategories':
            _subcategories?.map((StaffSubcategory? e) => e?.toJson()).toList(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'id': id,
        'name': _name,
        'email': _email,
        'archived': _archived,
        'documents': _documents,
        'notices': _notices,
        'notifications': _notifications,
        'aircraft': _aircraft,
        'roles': _roles,
        'subcategories': _subcategories,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<StaffModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<StaffModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final EMAIL = amplify_core.QueryField(fieldName: "email");
  static final ARCHIVED = amplify_core.QueryField(fieldName: "archived");
  static final DOCUMENTS = amplify_core.QueryField(
      fieldName: "documents",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Document'));
  static final NOTICES = amplify_core.QueryField(
      fieldName: "notices",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Notice'));
  static final NOTIFICATIONS = amplify_core.QueryField(
      fieldName: "notifications",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Notification'));
  static final AIRCRAFT = amplify_core.QueryField(
      fieldName: "aircraft",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'AircraftStaff'));
  static final ROLES = amplify_core.QueryField(
      fieldName: "roles",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'RoleStaff'));
  static final SUBCATEGORIES = amplify_core.QueryField(
      fieldName: "subcategories",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'StaffSubcategory'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Staff";
    modelSchemaDefinition.pluralName = "Staff";

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
      amplify_core.ModelIndex(fields: const ["id"], name: null),
      amplify_core.ModelIndex(fields: const ["email"], name: "staffByEmail")
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Staff.NAME,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Staff.EMAIL,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Staff.ARCHIVED,
        isRequired: false,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Staff.DOCUMENTS,
        isRequired: false,
        ofModelName: 'Document',
        associatedKey: Document.STAFF));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Staff.NOTICES,
        isRequired: false,
        ofModelName: 'Notice',
        associatedKey: Notice.AUTHOR));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Staff.NOTIFICATIONS,
        isRequired: false,
        ofModelName: 'Notification',
        associatedKey: Notification.STAFF));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Staff.AIRCRAFT,
        isRequired: false,
        ofModelName: 'AircraftStaff',
        associatedKey: AircraftStaff.STAFF));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Staff.ROLES,
        isRequired: false,
        ofModelName: 'RoleStaff',
        associatedKey: RoleStaff.STAFF));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
        key: Staff.SUBCATEGORIES,
        isRequired: false,
        ofModelName: 'StaffSubcategory',
        associatedKey: StaffSubcategory.STAFF));

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

class _StaffModelType extends amplify_core.ModelType<Staff> {
  const _StaffModelType();

  @override
  Staff fromJson(Map<String, dynamic> jsonData) {
    return Staff.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Staff';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Staff] in your schema.
 */
class StaffModelIdentifier implements amplify_core.ModelIdentifier<Staff> {
  final String id;

  /** Create an instance of StaffModelIdentifier using [id] the primary key. */
  const StaffModelIdentifier({required this.id});

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
  String toString() => 'StaffModelIdentifier(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is StaffModelIdentifier && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
