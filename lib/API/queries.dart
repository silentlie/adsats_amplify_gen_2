const getCrewDocumentCategoryDetails = '''
query GetCrewDocumentCategoryDetails(\$id: ID) {
  getCrewDocumentCategory(id: \$id) {
    crewDocuments {
      items {
        id
      }
    }
    id
  }
}
''';
const listJoinRecipients = '''
query ListJoinRecipients(\$rolesFilter: ModelRoleStaffFilterInput, \$aircraftFilter: ModelAircraftStaffFilterInput) {
  listStaff {
    items {
      id
      name
      email
      archived
      createdAt
      updatedAt
      aircraft(filter: \$aircraftFilter) {
        items {
          id
        }
      }
      roles(filter: \$rolesFilter) {
        items {
          id
        }
      }
    }
  }
}
''';
const listCrewDocumentCategories = '''
query ListCrewDocumentCategories(\$filter: ModelCrewDocumentCategoryFilterInput, \$id: ID!) {
  getRole(id: \$id) {
    id
    name
    categories(filter: \$filter) {
      items {
        id
        name
        description
        archived
        createdAt
        updatedAt
        role {
          id
          name
          description
          archived
        }
      }
    }
  }
}
''';
const listCrewDocuments = '''
query ListCrewDocumentsCrews(\$staffId: ID!, \$categoryId: ID!) {
  listCrewDocuments(filter: {staffId: {eq: \$staffId}, categoryId: {eq: \$categoryId}}) {
    items {
      id
      categoryId
      staffId
      name
      archived
      createdAt
      updatedAt
    }
  }
}
''';
const listCrewDocumentCrews = '''
query ListCrewDocumentCrews(\$aircraftId: ID!, \$roleId: ID!) {
  getRole(id: \$roleId) {
    staff {
      items {
        staff {
          id
          name
          aircraft(filter: {aircraftId: {eq: \$aircraftId}}) {
            items {
              id
              aircraftId
            }
          }
        }
      }
    }
  }
}
''';
const listCrewDocumentMeta = '''
query ListCrewDocumentMeta {
  listRoles(filter: {archived: {eq: false}}) {
    items {
      id
      name
    }
  }
  listAircraft(filter: {archived: {eq: false}}) {
    items {
      id
      name
    }
  }
  listCrewDocumentCategories(filter: {archived: {eq: false}}) {
    items {
      id
      name
    }
  }
}
''';
const listNotices = '''
query ListNotices(\$filter: ModelNoticeFilterInput) {
  listNotices(filter: \$filter) {
    items {
      id
      type
      subject
      status
      archived
      noticedAt
      deadlineAt
      createdAt
      updatedAt
      details
      author {
        id
        name
        email
        archived
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
}
''';
const getNoticeDetails = '''
query GetNoticeDetails(\$id: ID!) {
  getNotice(id: \$id) {
    id
    type
    subject
    status
    archived
    noticedAt
    deadlineAt
    details
    author {
      id
      name
      email
      archived
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
query ListSubcategories(\$filter: ModelSubcategoryFilterInput, \$id: ID!) {
  getCategory(id: \$id) {
    id
    name
    subcategories(filter: \$filter) {
      items {
        id
        name
        description
        archived
        createdAt
        updatedAt
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
        category {
          id
          name
          description
          archived
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
      categories {
        items {
          id
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
  listDocuments(filter: \$filter, limit: 10000) {
    items {
      id
      name
      createdAt
      archived
      staff {
        id
        name
      }
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
          archived
          category {
            id
            name
            archived
          }
        }
      }
    }
    notifications(filter: {readAt: {eq: null}}) {
      items {
        id
        notice {
          id
          archived
          deadlineAt
          status
          subject
          type
          author {
            id
            name
          }
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
    reportNotifications {
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
    documents {
      items {
        id
      }
    }
  }
}
''';
