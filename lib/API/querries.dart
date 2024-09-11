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
      }
      staff {
        items {
          id
          accessLevel
          staff {
            id
            name
            email
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
          }
        }
      }
      roles {
        items {
          id
          role {
            name
            id
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
          }
        }
      }
    }
  }
}
''';
