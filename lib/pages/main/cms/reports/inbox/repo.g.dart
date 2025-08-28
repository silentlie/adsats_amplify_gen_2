// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(reportsInboxRepo)
const reportsInboxRepoProvider = ReportsInboxRepoFamily._();

final class ReportsInboxRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Report>>, List<Report>, FutureOr<List<Report>>>
    with $FutureModifier<List<Report>>, $FutureProvider<List<Report>> {
  const ReportsInboxRepoProvider._(
      {required ReportsInboxRepoFamily super.from,
      required ReportFilterState super.argument})
      : super(
          retry: null,
          name: r'reportsInboxRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = listReportStaffProvider;

  @override
  String debugGetCreateSourceHash() => _$reportsInboxRepoHash();

  @override
  String toString() {
    return r'reportsInboxRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Report>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Report>> create(Ref ref) {
    final argument = this.argument as ReportFilterState;
    return reportsInboxRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReportsInboxRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportsInboxRepoHash() => r'91883f362b96445cfe88391e22c085b89c5c391f';

final class ReportsInboxRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Report>>, ReportFilterState> {
  const ReportsInboxRepoFamily._()
      : super(
          retry: null,
          name: r'reportsInboxRepoProvider',
          dependencies: const <ProviderOrFamily>[listReportStaffProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            ReportsInboxRepoProvider.$allTransitiveDependencies0,
          ],
          isAutoDispose: true,
        );

  ReportsInboxRepoProvider call(
    ReportFilterState filter,
  ) =>
      ReportsInboxRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'reportsInboxRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
