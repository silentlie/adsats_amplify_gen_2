import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

const listNotices = '''
query ListNotices(\$filter: ModelNoticeFilterInput) {
  listNotices(filter: \$filter) {
    items {
      id
      subject
      type
      status
      aircraft {
        items {
          id
          aircraft {
            id
            name
          }
        }
      }
      archived
      noticed_at
      deadline_at
      createdAt
    }
  }
}
''';
const getNoticeDetails = '''
query GetNoticeDetails(\$id: ID!) {
  getNotice(id: \$id) {
    type
    subject
    status
    archived
    noticed_at
    deadline_at
    details
    author {
      id
      name
    }
    aircraft {
      items {
        id
        aircraft {
          id
          name
          archived
          description
        }
      }
    }
    documents {
      items {
        id
        name
      }
    }
    recipients {
      items {
        id
        staff {
          id
          name
          email
          archived
        }
      }
    }
  }
}
''';
const listSubcategories = '''
query ListSubcategories(\$filter: ModelSubcategoryFilterInput) {
  listSubcategories(filter: \$filter) {
    items {
      id
      name
      description
      archived
      createdAt
      updatedAt
      category {
        id
        name
        description
        archived
      }
      staff {
        items {
          id
          accessLevel
          staff {
            id
            name
            email
            archived
          }
        }
      }
    }
  }
}
''';
const listCategories = '''
query ListCategories(\$filter: ModelCategoryFilterInput) {
  listCategories(filter: \$filter) {
    items {
      id
      name
      description
      createdAt
      archived
      updatedAt
      subcategories {
        items {
          id
          name
        }
      }
    }
  }
}
''';
const listAircraft = '''
query ListAircraft(\$filter: ModelAircraftFilterInput) {
  listAircraft(filter: \$filter) {
    items {
      id
      name
      description
      createdAt
      archived
      updatedAt
      staff {
        items {
          id
          staff {
            id
            name
            email
            archived
          }
        }
      }
    }
  }
}
''';
const listRoles = '''
query ListRoles(\$filter: ModelRoleFilterInput) {
  listRoles(filter: \$filter) {
    items {
      id
      name
      description
      createdAt
      archived
      updatedAt
      staff {
        items {
          id
          staff {
            id
            name
            email
            archived
          }
        }
      }
    }
  }
}
''';
const listStaff = '''
query ListStaff(\$filter: ModelStaffFilterInput) {
  listStaff(filter: \$filter) {
    items {
      id
      name
      email
      createdAt
      archived
      updatedAt
      aircraft {
        items {
          id
          aircraft {
            id
            name
            archived
            description
          }
        }
      }
      roles {
        items {
          id
          role {
            name
            id
            archived
            description
          }
        }
      }
      subcategories {
        items {
          accessLevel
          id
          subcategory {
            id
            name
            archived
            description
            category {
              id
              name
              archived
              description
            }
          }
        }
      }
    }
  }
}
''';
const listDocuments = '''
query ListDocuments(\$filter: ModelDocumentFilterInput) {
  listDocuments(filter: \$filter) {
    items {
      id
      name
      createdAt
      archived
      subcategory {
        id
        name
        category {
          id
          name
        }
      }
      aircraft {
        items {
          id
          aircraft {
            id
            name
          }
        }
      }
    }
  }
}
''';
const getStaff = '''
query GetStaff(\$id: ID!) {
  getStaff(id: \$id) {
    id
    name
    email
    archived
    aircraft {
      items {
        id
        aircraft {
          id
          name
        }
      }
    }
    roles {
      items {
        id
        role {
          id
          name
        }
      }
    }
    subcategories {
      items {
        id
        accessLevel
        subcategory {
          id
          name
          category {
            id
            name
          }
        }
      }
    }
    notifications(filter: {read_at: {attributeExists: false}}) {
      items {
        id
        notice {
          id
          archived
          deadline_at
          status
          subject
          type
        }
      }
    }
  }
}
''';
const getStaffDetails = '''
query GetStaffDetails(\$id: ID!) {
  getStaff(id: \$id) {
    id
    aircraft {
      items {
        id
      }
    }
    roles {
      items {
        id
      }
    }
    subcategories {
      items {
        id
      }
    }
    notifications {
      items {
        id
      }
    }
  }
}
''';
const getAircraftDetails = '''
query GetAircraftDetails(\$id: ID!) {
  getAircraft(id: \$id) {
    id
    document {
      items {
        id
      }
    }
    notices {
      items {
        id
      }
    }
    staff {
      items {
        id
      }
    }
  }
}
''';
const getSubcategoryDetails = '''
query GetSubcategoryDetails(\$id: ID!) {
  getSubcategory(id: \$id) {
    id
    staff {
      items {
        id
      }
    }
  }
}
''';
Future<List<T>> list<T extends Model>(
  ModelType<T> modelType, {
  QueryPredicate<Model>? where,
}) async {
  try {
    final request = ModelQueries.list(modelType, where: where);
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    return response.data?.items.cast<T>() ?? [];
  } on ApiException catch (e) {
    debugPrint('ApiExecption: list $modelType failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: list $modelType failed: $e');
    rethrow;
  }
}

Future<T?> get<T extends Model>(
  ModelType<T> modelType,
  ModelIdentifier<T> modelIdentifier,
) async {
  try {
    final request = ModelQueries.get(modelType, modelIdentifier);
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    return response.data as T;
  } on ApiException catch (e) {
    debugPrint('ApiExecption: get $modelType failed: $e');
    rethrow;
  } on Exception catch (e) {
    debugPrint('Dart Exception: get $modelType failed: $e');
    rethrow;
  }
}
