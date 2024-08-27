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

import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'Aircraft.dart';
import 'AircraftDocument.dart';
import 'AircraftNotice.dart';
import 'AircraftStaff.dart';
import 'Category.dart';
import 'Document.dart';
import 'Notice.dart';
import 'NoticeDocument.dart';
import 'Notification.dart';
import 'Role.dart';
import 'RoleStaff.dart';
import 'Staff.dart';
import 'StaffSubcategory.dart';
import 'Subcategory.dart';

export 'Aircraft.dart';
export 'AircraftDocument.dart';
export 'AircraftNotice.dart';
export 'AircraftStaff.dart';
export 'Category.dart';
export 'Document.dart';
export 'Notice.dart';
export 'NoticeDocument.dart';
export 'NoticeStatus.dart';
export 'NoticeType.dart';
export 'Notification.dart';
export 'Role.dart';
export 'RoleStaff.dart';
export 'Staff.dart';
export 'StaffSubcategory.dart';
export 'Subcategory.dart';

class ModelProvider implements amplify_core.ModelProviderInterface {
  @override
  String version = "3812b68c7d4d6b3e92f1e57f565bebfe";
  @override
  List<amplify_core.ModelSchema> modelSchemas = [Aircraft.schema, AircraftDocument.schema, AircraftNotice.schema, AircraftStaff.schema, Category.schema, Document.schema, Notice.schema, NoticeDocument.schema, Notification.schema, Role.schema, RoleStaff.schema, Staff.schema, StaffSubcategory.schema, Subcategory.schema];
  @override
  List<amplify_core.ModelSchema> customTypeSchemas = [];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  amplify_core.ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Aircraft":
        return Aircraft.classType;
      case "AircraftDocument":
        return AircraftDocument.classType;
      case "AircraftNotice":
        return AircraftNotice.classType;
      case "AircraftStaff":
        return AircraftStaff.classType;
      case "Category":
        return Category.classType;
      case "Document":
        return Document.classType;
      case "Notice":
        return Notice.classType;
      case "NoticeDocument":
        return NoticeDocument.classType;
      case "Notification":
        return Notification.classType;
      case "Role":
        return Role.classType;
      case "RoleStaff":
        return RoleStaff.classType;
      case "Staff":
        return Staff.classType;
      case "StaffSubcategory":
        return StaffSubcategory.classType;
      case "Subcategory":
        return Subcategory.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}


class ModelFieldValue<T> {
  const ModelFieldValue.value(this.value);

  final T value;
}
