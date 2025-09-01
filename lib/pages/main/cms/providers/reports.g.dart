// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(reports)
const reportsProvider = ReportsFamily._();

final class ReportsProvider extends $FunctionalProvider<
        AsyncValue<List<Report>>, List<Report>, FutureOr<List<Report>>>
    with $FutureModifier<List<Report>>, $FutureProvider<List<Report>> {
  const ReportsProvider._(
      {required ReportsFamily super.from, required InboxOrSent super.argument})
      : super(
          retry: null,
          name: r'reportsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = reportFilterProvider;
  static const $allTransitiveDependencies1 =
      ReportFilterProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      ReportFilterProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$reportsHash();

  @override
  String toString() {
    return r'reportsProvider'
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
    final argument = this.argument as InboxOrSent;
    return reports(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReportsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportsHash() => r'788463f3db59052e68f4312f2ce8c9ad192d06d4';

final class ReportsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Report>>, InboxOrSent> {
  const ReportsFamily._()
      : super(
          retry: null,
          name: r'reportsProvider',
          dependencies: const <ProviderOrFamily>[reportFilterProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            ReportsProvider.$allTransitiveDependencies0,
            ReportsProvider.$allTransitiveDependencies1,
            ReportsProvider.$allTransitiveDependencies2,
          ],
          isAutoDispose: true,
        );

  ReportsProvider call(
    InboxOrSent type,
  ) =>
      ReportsProvider._(argument: type, from: this);

  @override
  String toString() => r'reportsProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
