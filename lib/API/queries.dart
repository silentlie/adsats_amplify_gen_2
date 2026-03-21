const listSessionsGraphQL = '''
query ListSessions(\$filter: ModelSessionFilterInput, \$limit: Int = 1) {
  listSessions(filter: \$filter, limit: \$limit) {
    items {
      staff {
        id
      }
      createdAt
      id
      staffId
      updatedAt
    }
  }
}
''';
const listStaffKPIGraphQL = '''
query listStaffKPI(
  \$staffFilter: ModelStaffFilterInput,
  \$noticeFilter: ModelNoticeFilterInput,
  \$reportFilter: ModelReportFilterInput,
) {
  listStaff(filter: \$staffFilter, limit: 10000) {
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
const listStaffByRoleGraphQL = '''
query ListStaffByRole(\$roleName: String!) {
  listRoles(filter: {name: {eq: \$roleName}}, limit: 10000) {
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
            email
          }
        }
      }
    }
  }
}
''';
const listReportsGraphQL = '''
query ListReports(\$filter: ModelReportFilterInput) {
  listReports(filter: \$filter, limit: 10000) {
    items {
      id
      type
      subject
      status
      archived
      discrepanciesFound
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
          isRead
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
const getReportDetailsGraphQL = '''
query GetReportDetails(\$id: ID!) {
  getReport(id: \$id) {
    id
    type
    subject
    status
    archived
    discrepanciesFound
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
        isRead
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
const getFlightCrewRecordsCategoryDetailsGraphQL = '''
query GetFlightCrewRecordsCategoryDetails(\$id: ID) {
  getFlightCrewRecordCategory(id: \$id) {
    flightCrewRecords {
      items {
        id
      }
    }
    id
  }
}
''';
const listJoinRecipientsGraphQL = '''
query ListJoinRecipients(\$rolesFilter: ModelRoleStaffFilterInput, \$aircraftFilter: ModelAircraftStaffFilterInput) {
  listStaff(limit: 10000) {
    items {
      id
      firstName
      lastName
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
const listFlightCrewRecordCategoriesGraphQL = '''
query ListFlightCrewRecordCategories(\$filter: ModelFlightCrewRecordCategoryFilterInput, \$id: ID!) {
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
const listProfileMetaGraphQL = '''
query ListProfileMeta(\$id: ID!) {
  listRoles(filter: {archived: {eq: false}}, limit: 10000) {
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
const listFlightCrewRecordsGraphQL = '''
query ListFlightCrewRecords(\$filter: ModelFlightCrewRecordFilterInput) {
  listFlightCrewRecords(filter: \$filter, limit: 10000) {
    items {
      id
      categoryId
      staffId
      name
      archived
      createdAt
      updatedAt
      issuedAt
      expiredAt
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
''';
const listFlightCrewRecordsCrewsGraphQL = '''
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
const listFlightCrewRecordsMetaGraphQL = '''
query ListFlightCrewRecordsMeta {
  listRoles(filter: {archived: {eq: false}}, limit: 10000) {
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
const listNoticesGraphQL = '''
query ListNotices(\$filter: ModelNoticeFilterInput, \$aircraftFilter: ModelAircraftNoticeFilterInput) {
  listNotices(filter: \$filter, limit: 10000) {
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
      aircraft(filter: \$aircraftFilter) {
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
const getNoticeDetailsGraphQL = '''
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
        readAt
        isRead
      }
    }
  }
}
''';
const listSubcategoriesGraphQL = '''
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
const listCategoriesGraphQL = '''
query ListCategories(\$filter: ModelCategoryFilterInput) {
  listCategories(filter: \$filter, limit: 10000) {
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
const listAircraftGraphQL = '''
query ListAircraft(\$filter: ModelAircraftFilterInput) {
  listAircraft(filter: \$filter, limit: 10000) {
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
const listRolesGraphQL = '''
query ListRoles(\$filter: ModelRoleFilterInput) {
  listRoles(filter: \$filter, limit: 10000) {
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
const listStaffGraphQL = '''
query ListStaff(\$filter: ModelStaffFilterInput) {
  listStaff(filter: \$filter, limit: 10000) {
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
const listDocumentsGraphQL = '''
query ListDocuments(\$filter: ModelDocumentFilterInput) {
  listDocuments(filter: \$filter, limit: 10000) {
    items {
      id
      name
      createdAt
      archived
      issuedAt
      expiredAt
      staff {
        id
        firstName
        lastName
        email
        archived
      }
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
const listRemindersGraphQL = '''
query listReminders(\$filter: ModelReminderFilterInput) {
  listReminders(filter: \$filter, limit: 10000) {
    items {
      id
      date
      createdAt
      updatedAt
      document {
        id
        name
        archived
        issuedAt
        expiredAt
      }
      staff {
        items {
          reminderId
          staffId
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
const getStaffGraphQL = '''
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
    notifications(filter: {isRead: {eq: false}}) {
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
const getStaffDetailsGraphQL = '''
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
    sessions {
      items {
        id
      }
    }
  }
}
''';
const getAircraftDetailsGraphQL = '''
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
const getSubcategoryDetailsGraphQL = '''
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
