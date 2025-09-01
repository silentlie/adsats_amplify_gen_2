// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(staffKPIRepo)
const staffKPIRepoProvider = StaffKPIRepoFamily._();

final class StaffKPIRepoProvider extends $FunctionalProvider<
        AsyncValue<List<StaffKPI>>, List<StaffKPI>, FutureOr<List<StaffKPI>>>
    with $FutureModifier<List<StaffKPI>>, $FutureProvider<List<StaffKPI>> {
  const StaffKPIRepoProvider._(
      {required StaffKPIRepoFamily super.from,
      required StaffKPIFilterState super.argument})
      : super(
          retry: null,
          name: r'staffKPIRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$staffKPIRepoHash();

  @override
  String toString() {
    return r'staffKPIRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<StaffKPI>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<StaffKPI>> create(Ref ref) {
    final argument = this.argument as StaffKPIFilterState;
    return staffKPIRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StaffKPIRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$staffKPIRepoHash() => r'531e77e01511c2644c0e1cadc208188828246f0a';

final class StaffKPIRepoFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<StaffKPI>>,
            StaffKPIFilterState> {
  const StaffKPIRepoFamily._()
      : super(
          retry: null,
          name: r'staffKPIRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  StaffKPIRepoProvider call(
    StaffKPIFilterState filter,
  ) =>
      StaffKPIRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'staffKPIRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
