# ADSATS Amplify Gen 2

ADSATS - Aviation Document Storage and Tracking System v3.

This repository contains the Flutter client and AWS Amplify Gen 2 backend for ADSATS. The app manages aviation documents, staff records, aircraft records, notices, audit reports, reminders, and KPI views.

## Contents

- [Application Areas](#application-areas)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Local Setup](#local-setup)
- [Amplify Configuration](#amplify-configuration)
- [Generated Code](#generated-code)
- [Development Workflow](#development-workflow)
- [Validation](#validation)
- [Troubleshooting](#troubleshooting)

## Application Areas

The main app shell exposes these user-facing areas:

- Home
- Documents
- SMS notices
- CMS reports
- Flight crew records
- Help
- KPI

The admin shell exposes:

- Aircraft
- Roles
- Staff
- Categories and subcategories

## Tech Stack

- Flutter and Dart
- AWS Amplify Flutter
- Amplify Gen 2 backend
- Cognito authentication
- AppSync/Data GraphQL API
- S3 storage
- Lambda functions for Cognito admin actions, email, notifications, and reminder dispatch
- Riverpod for state management and generated providers
- GoRouter with typed generated routes
- Freezed and JSON serialization for immutable app models

## Project Structure

```text
amplify/              Amplify Gen 2 backend resources
  auth/               Cognito auth configuration
  data/               Data schema, custom mutations, and Lambda functions
  storage/            S3 storage access rules
assets/               App logos and SVG assets
lib/
  API/                Amplify API and storage wrappers
  auth/               Auth/session helpers and sign-in UI
  helper/             Shared providers, extensions, mixins, and enums
  models/             Amplify generated model classes
  pages/              Feature modules and screens
  router/             GoRouter route definitions and generated routes
  settings/           App settings state
  theme/              Light/dark theme configuration
test/                 Flutter tests
```

Feature modules generally follow this pattern:

```text
widgets/              UI components for a feature
providers/            Riverpod providers and services
models/               Feature-specific Freezed/JSON models
data/                 Repository layer for API/data access
```

## Prerequisites

- Flutter SDK compatible with Dart `>=3.4.3 <4.0.0`
- Node.js and npm for Amplify Gen 2 tooling
- AWS credentials with access to the target Amplify app/environment
- Amplify app ID and branch name for generated output/model commands

## Local Setup

Install Flutter dependencies:

```powershell
flutter pub get
```

Install Amplify/backend tooling from the repository root:

```powershell
npm install
```

Regenerate local Dart files after provider, route, Freezed, or JSON model changes:

```powershell
dart run build_runner build --delete-conflicting-outputs
```

Run the app:

```powershell
flutter run
```

For web development:

```powershell
flutter run -d chrome
```

## Amplify Configuration

The app configures these Amplify plugins in `lib/main.dart`:

- `AmplifyAuthCognito`
- `AmplifyAPI`
- `AmplifyStorageS3`

The current app entry point imports:

```dart
import 'amplify_outputs.prod.dart';
```

If you are working against a different Amplify branch or app, regenerate the output file and update the import only when the target environment intentionally changes.

Generate Amplify outputs:

```powershell
npx ampx generate outputs --branch dev --app-id <app-id> --format dart --out-dir lib
```

Generate Dart GraphQL model classes:

```powershell
npx ampx generate graphql-client-code --format modelgen --model-target dart --out lib/models --branch dev --app-id <app-id>
```

Replace `<app-id>` and `dev` with the target Amplify app ID and branch.

## Backend Resources

The backend is defined in `amplify/backend.ts` and includes:

- `auth`: email-based Cognito authentication and Cognito admin function access
- `data`: Amplify Data schema, custom GraphQL mutations, and model authorization
- `storage`: S3 storage rules for documents, flight crew records, notice documents, and report documents
- `runReminderDispatch`: scheduled/dispatch function for reminders

The data schema includes core ADSATS entities such as:

- Staff and sessions
- Categories and subcategories
- Documents and reminders
- Roles and flight crew record categories
- Aircraft
- Notices and notice recipients/documents
- Reports, report recipients, and report documents

## Generated Code

This project uses generated files from multiple tools. When changing source files that use annotations or generated routes, rerun build runner.

Common generated file types:

- `*.g.dart`: Riverpod, GoRouter, JSON serialization, and other generated code
- `*.freezed.dart`: Freezed immutable model support
- `lib/models/*.dart`: Amplify generated GraphQL model classes
- `lib/amplify_outputs*.dart`: Amplify generated environment configuration

Useful command:

```powershell
dart run build_runner build --delete-conflicting-outputs
```

Use this after editing files that include annotations from Riverpod, Freezed, JSON Serializable, or GoRouter.

## Development Workflow

Recommended flow for app changes:

1. Identify the feature module under `lib/pages`.
2. Trace the UI provider/service/repository/API path before changing behavior.
3. Keep generated files in sync with source changes.
4. Run static analysis and focused tests.
5. Manually verify the affected route or workflow.

Recommended flow for backend schema changes:

1. Update `amplify/data/resource.ts`.
2. Update related Lambda/resource files if needed.
3. Generate updated Amplify outputs and Dart model classes.
4. Update repositories and providers that depend on the changed model/query shape.
5. Run build runner for app-side generated code.
6. Validate the affected app screens.

Recommended flow for filters and list queries:

1. Start at the feature filter/provider state.
2. Check how the filter serializes to JSON or GraphQL input.
3. Follow the repository method that builds the API request.
4. Confirm the GraphQL query supports the field being filtered.
5. Verify behavior in each relevant list scope, such as inbox, sent, and all.

## Validation

Run static analysis:

```powershell
flutter analyze
```

Run Flutter tests:

```powershell
flutter test
```

Run code generation:

```powershell
dart run build_runner build --delete-conflicting-outputs
```

The repository currently has a basic Flutter widget test under `test/widget_test.dart`. Replace or expand it with ADSATS-specific smoke tests as real workflows are covered.

## Troubleshooting

### Amplify fails to configure

- Confirm the imported `amplify_outputs*.dart` file matches the intended app and branch.
- Confirm Cognito, API, and Storage resources exist in the target backend.
- Confirm the user has valid credentials and belongs to the expected environment.

### Generated files are stale

- Run `dart run build_runner build --delete-conflicting-outputs`.
- If the Amplify schema changed, regenerate Dart model classes with `npx ampx generate graphql-client-code`.
- If the backend environment changed, regenerate outputs with `npx ampx generate outputs`.

### Queries or filters return unexpected results

- Trace the provider state, filter serialization, repository call, and GraphQL query together.
- Check whether the current screen is using inbox, sent, or all scope behavior.
- Confirm archived records and relationship filters are handled consistently.

### Storage uploads or downloads fail

- Confirm the file is being written under one of the allowed storage prefixes:
  - `documents/*`
  - `flightCrewRecords/*`
  - `noticeDocuments/*`
  - `reportDocuments/*`
  - `delete/*`
- Confirm the user is authenticated.

## Security Notes

- Do not commit secrets, local AWS credentials, or private environment values.
- Treat generated Amplify output files as environment-specific.
- Review authorization changes in `amplify/data/resource.ts`, `amplify/auth/resource.ts`, and `amplify/storage/resource.ts` carefully.
