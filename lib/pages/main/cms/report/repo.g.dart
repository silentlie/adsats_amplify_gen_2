// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(reportRepo)
const reportRepoProvider = ReportRepoFamily._();

final class ReportRepoProvider
    extends $FunctionalProvider<AsyncValue<Report>, Report, FutureOr<Report>>
    with $FutureModifier<Report>, $FutureProvider<Report> {
  const ReportRepoProvider._(
      {required ReportRepoFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'reportRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reportRepoHash();

  @override
  String toString() {
    return r'reportRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Report> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Report> create(Ref ref) {
    final argument = this.argument as String;
    return reportRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReportRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportRepoHash() => r'1f1004260ca717afe7a62c047c6b8a7367b624e6';

final class ReportRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Report>, String> {
  const ReportRepoFamily._()
      : super(
          retry: null,
          name: r'reportRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ReportRepoProvider call(
    String id,
  ) =>
      ReportRepoProvider._(argument: id, from: this);

  @override
  String toString() => r'reportRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
