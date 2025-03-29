const listStaffKPI = '''
query listStaffKPI(
  \$staffFilter: ModelStaffFilterInput,
  \$noticeFilter: ModelNoticeFilterInput,
  \$reportFilter: ModelReportFilterInput,
) {
  listStaff(filter: \$staffFilter) {
    items {
      id
      firstName
      lastName
      archived
      notices(filter: \$noticeFilter) {
        items {
          id
          type
        }
      }
      reports(filter: \$reportFilter) {
        items {
          id
          type
        }
      }
    }
  }
}
''';
const listStaffByRole = '''
query ListStaffByRole(\$roleName: String!) {
  listRoles(filter: {name: {eq: \$roleName}}) {
    items {
      id
      name
      staff {
        items {
          id
          staff {
            id
            firstName
            lastName
          }
        }
      }
    }
  }
}
''';

const listReports = '''
query ListReports(\$filter: ModelReportFilterInput) {
  listReports(filter: \$filter) {
    items {
      id
      type
      subject
      status
      archived
      reportedAt
      details
      createdAt
      updatedAt
      auditor {
        id
        firstName
        lastName
        email
        archived
      }
      closeAt
      closer {
        id
        firstName
        lastName
        email
        archived
      }
      recipients {
        items {
          id
          staff {
            id
            firstName
            lastName
            email
            archived
          }
        }
      }
      documents {
        items {
          id
          name
        }
      }
    }
  }
}
''';
const getReportDetails = '''
query GetReportDetails(\$id: ID!) {
  getReport(id: \$id) {
    id
    type
    subject
    status
    archived
    reportedAt
    details
    createdAt
    updatedAt
    auditor {
      id
      firstName
      lastName
      email
      archived
    }
    closeAt
    closer {
      id
      firstName
      lastName
      email
      archived
    }
    recipients {
      items {
        id
        staff {
          id
          firstName
          lastName
          email
          archived
        }
      }
    }
    documents {
      items {
        id
        name
      }
    }
  }
}
''';
const getFlightCrewRecordsCategoryDetails = '''
query GetFlightCrewRecordsCategoryDetails(\$id: ID) {
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
//TODO use listRoles instead
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
const listFlightCrewRecordsCategories = '''
query ListFlightCrewRecordsCategories(\$filter: ModelCrewDocumentCategoryFilterInput, \$id: ID!) {
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
const listProfileMeta = '''
query ListProfileMeta(\$id: ID!) {
  listRoles(filter: {archived: {eq: false}}) {
    items {
      id
      name
      categories(filter: {archived: {eq: false}}) {
        items {
          id
          name
        }
      }
      staff(filter: {staffId: {eq: \$id}}) {
        items {
          id
        }
      }
    }
  }
}
''';
const listFlightCrewRecords = '''
query ListFlightCrewRecords(\$filter: ModelCrewDocumentFilterInput) {
  listCrewDocuments(filter: \$filter) {
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
const listFlightCrewRecordsCrews = '''
query ListFlightCrewRecordsCrews(\$aircraftId: ID!, \$roleId: ID!) {
  getRole(id: \$roleId) {
    id
    staff {
      items {
        staff {
          id
          firstName
          lastName
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
const listFlightCrewRecordsMeta = '''
query ListFlightCrewRecordsMeta {
  listRoles(filter: {archived: {eq: false}}) {
    items {
      id
      name
      categories(filter: {archived: {eq: false}}) {
        items {
          id
          name
        }
      }
    }
  }
  listAircraft(filter: {archived: {eq: false}}) {
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
        firstName
        lastName
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
      firstName
      lastName
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
          firstName
          lastName
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
              firstName
              lastName
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
            firstName
            lastName
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
            firstName
            lastName
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
      firstName
      lastName
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
        firstName
        lastName
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
    firstName
    lastName
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
            firstName
            lastName
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
