// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(report)
const reportProvider = ReportFamily._();

final class ReportProvider
    extends $FunctionalProvider<AsyncValue<Report>, Report, FutureOr<Report>>
    with $FutureModifier<Report>, $FutureProvider<Report> {
  const ReportProvider._(
      {required ReportFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'reportProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reportHash();

  @override
  String toString() {
    return r'reportProvider'
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
    return report(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReportProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportHash() => r'717f74015ee7d9018a6e0e5afb10931e16830691';

final class ReportFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Report>, String> {
  const ReportFamily._()
      : super(
          retry: null,
          name: r'reportProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ReportProvider call(
    String id,
  ) =>
      ReportProvider._(argument: id, from: this);

  @override
  String toString() => r'reportProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
