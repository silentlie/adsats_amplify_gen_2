// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(reportsSentRepo)
const reportsSentRepoProvider = ReportsSentRepoFamily._();

final class ReportsSentRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Report>>, List<Report>, FutureOr<List<Report>>>
    with $FutureModifier<List<Report>>, $FutureProvider<List<Report>> {
  const ReportsSentRepoProvider._(
      {required ReportsSentRepoFamily super.from,
      required ReportFilterState super.argument})
      : super(
          retry: null,
          name: r'reportsSentRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reportsSentRepoHash();

  @override
  String toString() {
    return r'reportsSentRepoProvider'
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
    return reportsSentRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReportsSentRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportsSentRepoHash() => r'6c26b662d365faf6bfec652dc72034c6b073cf4d';

final class ReportsSentRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Report>>, ReportFilterState> {
  const ReportsSentRepoFamily._()
      : super(
          retry: null,
          name: r'reportsSentRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ReportsSentRepoProvider call(
    ReportFilterState filter,
  ) =>
      ReportsSentRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'reportsSentRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
