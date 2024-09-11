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
          subcategoryId
          staffId
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
