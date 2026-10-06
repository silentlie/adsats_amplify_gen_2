# Known Issues

This register tracks the 28 ADSATS findings supplied on 6 October 2026. Preserve the
`KI-01` through `KI-28` identifiers when discussing, fixing, or closing an issue.
The descriptions and priorities below come from that supplied assessment; they
are reported findings, not a completed audit of the current application or deployed
backend. Source links are starting points for investigation.

Recorded: **2026-10-06**. Last register update: **2026-10-06**.

## Tracking conventions

- **P1:** Supplied high-priority finding.
- **P2:** Supplied medium-priority finding.
- **P1/P2:** Priority requires triage; retain the supplied classification until
  impact and scope are confirmed.
- **Reported:** Awaiting source review or reproduction.
- **Confirmed:** Reproduced or supported by recorded source evidence.
- **In progress:** A fix is being prepared; verification is incomplete.
- **Resolved:** A fix is committed and the issue's verification criteria pass.
- **Closed:** Resolution is verified in the target environment, or a documented
  triage decision explains why no fix is required.

Assign an owner in the index when work begins. Update the issue's status, record
the fix commit or pull request and verification evidence under its details, and
update the register date. Keep resolved entries so their IDs remain stable.
For a closed issue, record the closure date and reason or target environment.

Initial status: **27 Reported, 1 In progress**. KI-13 has an existing local code
change; its validation and commit are still pending. All owners are unassigned.

## Issue index

| ID | Priority | Area | Status | Owner | Finding |
| --- | --- | --- | --- | --- | --- |
| [KI-01](#ki-01) | P1 | Authorization | Reported | Unassigned | Broad data schema authorization |
| [KI-02](#ki-02) | P1 | Storage / Authorization | Reported | Unassigned | Broad authenticated storage access |
| [KI-03](#ki-03) | P1 | Cognito / Authorization | Reported | Unassigned | Missing administrative caller checks |
| [KI-04](#ki-04) | P1 | Email / Authorization | Reported | Unassigned | General authenticated email relay |
| [KI-05](#ki-05) | P1 | Authentication | Reported | Unassigned | Shared hard-coded temporary password |
| [KI-06](#ki-06) | P1 | Roles / Authorization | Reported | Unassigned | Mutable display names determine system roles |
| [KI-07](#ki-07) | P1 | CMS | Reported | Unassigned | Ordinary auditor can reopen a closed report |
| [KI-08](#ki-08) | P1 | CMS | Reported | Unassigned | Reopened report retains closure metadata |
| [KI-09](#ki-09) | P1 | Staff / Data Integrity | Reported | Unassigned | Incomplete staff deletion cascade |
| [KI-10](#ki-10) | P1/P2 | Reminders / Email | Reported | Unassigned | Partial reminder delivery prevents retries |
| [KI-11](#ki-11) | P1/P2 | Notifications / Email | Reported | Unassigned | Recipient failures do not fail notification operation |
| [KI-12](#ki-12) | P2 | Notifications / Security | Reported | Unassigned | Email links trust caller-supplied host |
| [KI-13](#ki-13) | P2 | SMS | In progress | Unassigned | Notice status filter is always true |
| [KI-14](#ki-14) | P2 | Reminders / Pagination | Reported | Unassigned | Dispatch processes only one reminder page |
| [KI-15](#ki-15) | P2 | GraphQL / Pagination | Reported | Unassigned | Hard limits and incomplete nested pagination |
| [KI-16](#ki-16) | P2 | Data Integrity | Reported | Unassigned | Multi-step mutations can leave partial state |
| [KI-17](#ki-17) | P2 | Router / Authentication | Reported | Unassigned | Every redirect invalidates authentication state |
| [KI-18](#ki-18) | P2 | Sessions | Reported | Unassigned | Unordered session selection |
| [KI-19](#ki-19) | P2 | Date Picker | Reported | Unassigned | Cancelling clears the selected date |
| [KI-20](#ki-20) | P2 | Date Range Picker | Reported | Unassigned | Cancelling clears the selected range |
| [KI-21](#ki-21) | P2 | Filtering / Dates | Reported | Unassigned | Date range excludes most of the final day |
| [KI-22](#ki-22) | P2 | CMS / Notifications | Reported | Unassigned | Incomplete report read and notification lifecycle |
| [KI-23](#ki-23) | P1/P2 | SMS / Authorization | Reported | Unassigned | Hazard author can edit Safety Officer fields |
| [KI-24](#ki-24) | P1/P2 | SMS / CMS Workflow | Reported | Unassigned | Saving unsent items publishes recipient joins |
| [KI-25](#ki-25) | P2 | Flight Crew Records | Reported | Unassigned | Rebuild resets new-record form values |
| [KI-26](#ki-26) | P2 | Documents / Archive Handling | Reported | Unassigned | Archived assignments remain upload targets |
| [KI-27](#ki-27) | P2 | CMS / SMS Form State | Reported | Unassigned | Hidden conditional fields retain stale data |
| [KI-28](#ki-28) | P2 | Notifications / Riverpod | Reported | Unassigned | Refresh does not refetch notification data |

## Issue details

### KI-01

**Broad data schema authorization**

- **Reported behavior:** The Amplify schema uses schema-wide `allow.authenticated()`
  rather than restricting operations at the model or record level.
- **Impact:** An authenticated account may perform operations beyond its intended
  application role.
- **Next action:** Define model, operation, and record permissions and enforce
  them server-side.
- **Verification:** Exercise permitted and denied operations with representative
  roles through the API directly, including access to another user's records.
- **Starting point:** [Data schema](../amplify/data/resource.ts).

### KI-02

**Broad authenticated storage access**

- **Reported behavior:** Document, flight crew record, notice attachment, and
  report attachment paths grant all authenticated users read, write, and delete
  access.
- **Impact:** Users may access or modify files outside their business permissions.
- **Next action:** Restrict storage paths and operations according to the agreed
  ownership and role requirements.
- **Verification:** Confirm permitted access and denied cross-user or cross-role
  reads, writes, and deletes for every affected storage prefix.
- **Starting point:** [Storage rules](../amplify/storage/resource.ts).

### KI-03

**Missing administrative caller checks**

- **Reported behavior:** `createUser`, `deleteUser`, `enableUser`, and `disableUser`
  accept authenticated callers without independently confirming that they are
  ADSATS administrators.
- **Impact:** A non-admin account may invoke privileged Cognito operations directly.
- **Next action:** Enforce administrative authorization in each mutation and
  its Lambda handler.
- **Verification:** Direct requests from non-admin accounts are denied without
  changing Cognito state; authorized administrator requests still succeed.
- **Starting points:** [Data mutations](../amplify/data/resource.ts) and
  [Cognito admin handlers](../amplify/data/cognito-admin/).

### KI-04

**General authenticated email relay**

- **Reported behavior:** `sendEmail` accepts caller-supplied recipients, subject,
  HTML body, and author.
- **Impact:** An authenticated caller may send arbitrary email through the ADSATS
  SES identity.
- **Next action:** Restrict sending to trusted server workflows or validate the
  caller's permissions, recipients, and content against the intended workflow.
- **Verification:** Unauthorized arbitrary sends are rejected before SES is
  called; approved application workflows deliver the expected email.
- **Starting point:** [Email handler](../amplify/data/send-email/handler.ts).

### KI-05

**Shared hard-coded temporary password**

- **Reported behavior:** Staff creation uses the same fixed temporary password
  for new users. The password value is intentionally omitted from this register.
- **Impact:** Predictable credentials weaken account security.
- **Next action:** Generate a cryptographically random temporary password per
  account or use Cognito's secure invitation/reset workflow.
- **Verification:** New accounts no longer share a fixed password, and users can
  complete the invitation and required password-change flow.
- **Starting points:** [Staff service](../lib/pages/admin/staff/providers/service.dart)
  and [Create-user handler](../amplify/data/cognito-admin/create-user/handler.ts).

### KI-06

**Mutable display names determine system roles**

- **Reported behavior:** Authorization depends on names such as `Admin`,
  `Safety Officer`, and `Compliance Manager`, while roles can be renamed,
  duplicated, archived, or deleted.
- **Impact:** Changes to reserved role names can break authorization or assign
  unintended privileges.
- **Next action:** Introduce immutable system role identifiers or codes, separate
  display names from authorization, and define reserved-role lifecycle rules.
- **Verification:** Renaming or duplicating a display name does not change
  permissions; reserved-role archive and deletion follow the agreed policy.
- **Starting point:** [Role management](../lib/pages/admin/roles/).

### KI-07

**Ordinary auditor can reopen a closed report**

- **Reported behavior:** A CMS report auditor can edit a closed report, and the
  status control exposes Draft, Open, and Pending states.
- **Impact:** A user who is not a Compliance Manager can reopen a closed report.
- **Next action:** Restrict transitions from Closed to an authorized Compliance
  Manager workflow, with server-side enforcement.
- **Verification:** An ordinary auditor cannot reopen a closed report through
  the UI or API; an authorized manager can complete the intended transition.
- **Starting points:** [Report form](../lib/pages/main/cms/create/widgets/report_basic_details.dart)
  and [CMS repository](../lib/pages/main/cms/data/repository.dart).

### KI-08

**Reopened report retains closure metadata**

- **Reported behavior:** Generated `copyWith()` methods use null-coalescing
  semantics, so passing null does not clear `closer` or `closeAt`.
- **Impact:** A reopened report may still display a previous closer and closure
  date.
- **Next action:** Use `copyWithModelFieldValues` or another update mechanism that
  explicitly clears nullable fields when the workflow requires it.
- **Verification:** After an authorized reopen and reload, both closure fields
  are null in persisted data and the UI. Closing again records new metadata.
- **Starting points:** [Report model](../lib/models/Report.dart) and
  [CMS service](../lib/pages/main/cms/providers/service.dart).

### KI-09

**Incomplete staff deletion cascade**

- **Reported behavior:** Hard deletion removes some staff joins but does not
  comprehensively handle all dependent records, including reminders and
  authored or owned domain records.
- **Impact:** Dangling relationships or future processing failures may remain
  after deletion.
- **Next action:** Inventory every Staff relationship, define whether each is
  removed, reassigned, retained, or blocks deletion, and implement that policy.
- **Verification:** Delete staff with every supported dependency, including
  partially loaded relationships, and confirm no unsupported references remain.
  Verify failure recovery and safe retries.
- **Starting points:** [Staff repository](../lib/pages/admin/staff/data/repository.dart)
  and [Data relationships](../amplify/data/resource.ts).

### KI-10

**Partial reminder delivery prevents retries**

- **Reported behavior:** A reminder is deleted if at least one recipient's email
  succeeds; it is retained only when all sends fail.
- **Impact:** Failed recipients lose their retry opportunity after another
  recipient receives the email.
- **Next action:** Persist recipient delivery state and retry failed recipients
  before deleting the reminder.
- **Verification:** For mixed success and failure, failed recipients remain
  retryable and successful recipients are not resent unnecessarily. Verify
  all-failure, all-success, and retry completion behavior.
- **Starting points:** [Reminder dispatch](../amplify/data/run-reminder-dispatch/handler.ts)
  and [Reminder cleanup](../amplify/data/run-reminder-dispatch/reminderCleanup.ts).

### KI-11

**Recipient failures do not fail notification operation**

- **Reported behavior:** Notification email failures return per-recipient
  `{ok: false}` results without rejecting the overall mutation.
- **Impact:** The client may report success despite one or more failed deliveries.
- **Next action:** Define an explicit complete, partial, or failed delivery result
  and ensure the client interprets and displays it.
- **Verification:** All-success, partial-failure, and all-failure cases produce
  accurate client-visible outcomes and identify recipients requiring recovery.
- **Starting points:** [Notification handler](../amplify/data/send-notification-email/handler.ts)
  and [Client email repository](../lib/API/amplify_notification_email_repository.dart).

### KI-12

**Email links trust caller-supplied host**

- **Reported behavior:** The client supplies `Uri.base`, and the notification
  Lambda combines that value with the notification path.
- **Impact:** A manipulated request may put links to an unintended host in ADSATS
  email.
- **Next action:** Configure the approved application base URL server-side.
- **Verification:** Changing or omitting the caller's host cannot alter the
  approved destination, and links reach the intended application route.
- **Starting point:** [Notification email workflow](../amplify/data/send-notification-email/).

### KI-13

**Notice status filter is always true**

- **Reported behavior:** The condition
  `status != Pending || status != Resolved` is true for every status.
- **Impact:** Pending and Resolved choices appear when they should be restricted.
- **Next action:** Apply the intended status and Safety Officer authorization
  rules instead of the always-true OR expression.
- **Verification:** Ordinary users cannot select the restricted statuses;
  authorized Safety Officers see the intended choices. Verify every status.
- **Starting point:** [Notice basic details](../lib/pages/main/sms/create/widgets/basic_details_widget.dart).
- **Progress recorded 2026-10-06:** An existing uncommitted edit changes the
  exclusion checks to AND and retains the Safety Officer override. Validation
  and a fix commit are pending; the change is outside the documentation commit.

### KI-14

**Dispatch processes only one reminder page**

- **Reported behavior:** The scheduled Lambda calls `Reminder.list()` once
  without following subsequent pagination tokens.
- **Impact:** Larger reminder sets can leave due reminders unprocessed.
- **Next action:** Iterate through all due reminder pages before dispatch ends.
- **Verification:** A dataset spanning multiple pages processes every due
  reminder, including an empty page with a continuation token, without duplicates.
- **Starting point:** [Reminder dispatch](../amplify/data/run-reminder-dispatch/handler.ts).

### KI-15

**Hard limits and incomplete nested pagination**

- **Reported behavior:** Some custom GraphQL queries use `limit: 10000`, and nested
  connections do not consistently retrieve every page.
- **Impact:** Results can be silently truncated at the chosen limit or a nested
  connection's default page size.
- **Next action:** Identify workflows requiring complete datasets and paginate
  both top-level queries and relevant nested connections.
- **Verification:** Query datasets beyond the configured limits and confirm
  complete top-level and related records, including filtered queries.
- **Starting point:** [Feature repositories](../lib/pages/).

### KI-16

**Multi-step mutations can leave partial state**

- **Reported behavior:** Some workflows change join records before the primary
  entity operation succeeds, without transactional protection.
- **Impact:** A failure can leave partially applied state or orphan relationships.
- **Next action:** Inventory affected workflows; reorder operations, add
  compensating rollback, or use transactional server operations where required.
- **Verification:** Inject failures at each operation boundary and confirm
  consistent primary and related records after failure, rollback, and retry.
- **Starting point:** [Feature repositories and services](../lib/pages/).

### KI-17

**Every redirect invalidates authentication state**

- **Reported behavior:** The router invalidates `userIdProvider` on every redirect.
- **Impact:** Navigation can trigger unnecessary Cognito session requests and
  provider rebuilds.
- **Next action:** Refresh authentication state when the session changes rather
  than on every navigation redirect.
- **Verification:** Normal navigation reuses current authentication state;
  sign-in, sign-out, and session expiry still update redirects correctly.
- **Starting point:** [Router](../lib/router/router.dart).

### KI-18

**Unordered session selection**

- **Reported behavior:** The session manager selects `firstOrNull` from a list
  with no explicit ordering guarantee.
- **Impact:** A historical session may be treated as the current session.
- **Next action:** Define current-session selection and use deterministic
  ordering or a direct lookup.
- **Verification:** Different result orders select the same intended session;
  empty results and equal timestamps have defined behavior.
- **Starting point:** [Session manager](../lib/auth/session_manager.dart).

### KI-19

**Cancelling clears the selected date**

- **Reported behavior:** A null result from `showDatePicker()` replaces the
  existing single-date value when the dialog is cancelled.
- **Impact:** Opening and cancelling the picker can discard a selected date.
- **Next action:** Keep the previous selection when the picker returns null.
- **Verification:** Cancel preserves an existing date, cancel with no selection
  keeps it empty, and confirming a new date updates the value.
- **Starting point:** [Date picker](../lib/widgets/date_picker_widget.dart).

### KI-20

**Cancelling clears the selected range**

- **Reported behavior:** Cancelling `showDateRangePicker()` clears the current
  date range.
- **Impact:** Existing filters disappear when the user presses Cancel.
- **Next action:** Update the range only for a non-null picker result.
- **Verification:** Cancel preserves an existing range and its active filter;
  confirming a new range updates both.
- **Starting point:** [Date range picker](../lib/widgets/date_range_picker.dart).

### KI-21

**Date range excludes most of the final day**

- **Reported behavior:** Date filters use midnight at the start of the selected
  final date as the end boundary.
- **Impact:** A range ending on 6 October may exclude records later on 6 October.
- **Next action:** Use an inclusive end-of-day boundary or an exclusive boundary
  at the start of the next day, with explicit timezone handling.
- **Verification:** Include records throughout the final day and exclude the
  following day; verify single-day ranges and timezone boundaries.
- **Starting points:** [Document filters](../lib/pages/main/documents/models/filter.dart),
  [Flight crew record filters](../lib/pages/main/flight_crew_records/models/filter.dart),
  and other feature date filters.

### KI-22

**Incomplete report read and notification lifecycle**

- **Reported behavior:** `ReportStaff` stores `isRead` and `readAt`, and report
  emails ask recipients to mark reports as read, but CMS lacks a complete
  acknowledgement flow and the notification feed covers notices only.
- **Impact:** Report notifications and persisted read state can diverge from
  the user experience.
- **Next action:** Implement CMS mark-as-read handling and report notifications
  in the application feed.
- **Verification:** Receiving, opening, and acknowledging a report updates the
  appropriate recipient's unread state and feed consistently after reload.
- **Starting points:** [ReportStaff model](../lib/models/ReportStaff.dart),
  [CMS module](../lib/pages/main/cms/), and [Notifications](../lib/notification/).

### KI-23

**Hazard author can edit Safety Officer fields**

- **Reported behavior:** General edit permission includes the hazard-report
  author, while the Safety Officer section checks edit mode and status without
  checking Safety Officer authorization.
- **Impact:** When that section becomes visible, an ordinary author can change
  confidential status, interim actions, review values, and closure information.
- **Next action:** Gate the section by Safety Officer permission and enforce
  field-level permissions on the server.
- **Verification:** Ordinary authors can edit only their permitted fields;
  attempts to update Safety Officer fields through the UI or API are denied.
  Authorized Safety Officers retain the intended workflow.
- **Starting points:** [SMS forms](../lib/pages/main/sms/create/)
  and [SMS service](../lib/pages/main/sms/providers/service.dart).

### KI-24

**Saving unsent items publishes recipient joins**

- **Reported behavior:** Notice and Report recipient joins are synchronized even
  when `send == false`; inbox membership is derived from those joins.
- **Impact:** Pressing Save without Submit and Send can expose the item in
  recipients' inboxes.
- **Next action:** Create or publish recipient joins only when the item is
  submitted/sent, or introduce an explicit publication state.
- **Verification:** Saving a new draft keeps it out of recipient inboxes;
  submission publishes it once. Verify subsequent saves and recipient changes
  against the agreed publication rules.
- **Starting points:** [SMS service](../lib/pages/main/sms/providers/service.dart)
  and [CMS service](../lib/pages/main/cms/providers/service.dart).

### KI-25

**Rebuild resets new-record form values**

- **Reported behavior:** New Flight Crew Record values `archived`, `issuedAt`,
  and `expiredAt` are local variables inside `build()`. Parent `setState()` resets
  them while child date pickers may keep displaying previous selections.
- **Impact:** Uploaded values can differ from the values visible in the form.
- **Next action:** Store those values in persistent widget or provider state.
- **Verification:** Select dates and archive state, trigger parent rebuilds, and
  submit; the saved record matches every displayed value.
- **Starting point:** [New flight crew record](../lib/pages/main/flight_crew_records/widgets/new.dart).

### KI-26

**Archived assignments remain upload targets**

- **Reported behavior:** New Document reads assignments from `userDetails`
  rather than active-only providers, and initial subcategory selection does not
  check archive state.
- **Impact:** Archived subcategories, parent categories, or aircraft can remain
  targets for new uploads.
- **Next action:** Filter all affected assignments before initial selection and
  display, and validate the selected target before uploading.
- **Verification:** Archived records and children of archived categories cannot
  become initial or selectable targets; active assignments still work and empty
  eligible lists are handled.
- **Starting points:** [New document](../lib/pages/main/documents/widgets/new.dart)
  and [Document details form](../lib/pages/main/documents/widgets/new_documents_details_form.dart).

### KI-27

**Hidden conditional fields retain stale data**

- **Reported behavior:** Switching CMS Discrepancies Found from Yes to No hides
  detail fields without clearing their values. Disabling a hazard mitigation
  comment similarly retains its old text.
- **Impact:** Hidden values can remain stored, reappear, or be processed despite
  the controlling option being disabled.
- **Next action:** Clear mutually exclusive detail values when their controlling
  state changes, according to the form's data contract.
- **Verification:** Enter details, disable the option, save, and reload; disabled
  fields are cleared. Re-enabling the option does not restore stale values.
- **Starting points:** [CMS form](../lib/pages/main/cms/create/widgets/report_basic_details.dart)
  and [SMS forms](../lib/pages/main/sms/create/).

### KI-28

**Refresh does not refetch notification data**

- **Reported behavior:** Refresh updates `notificationsProvider`, which derives
  its value from cached `userDetailsProvider` data rather than refetching it.
- **Impact:** Newly received or acknowledged notifications can remain stale
  after the user presses Refresh.
- **Next action:** Refresh/invalidate `userDetailsProvider` or introduce a
  dedicated notification query provider that requests backend data.
- **Verification:** Change notification state in the backend, press Refresh, and
  confirm a backend request updates the visible unread/read items.
- **Starting points:** [Notification provider](../lib/notification/notifications.dart)
  and [Notification widget](../lib/notification/notifications_widget.dart).
