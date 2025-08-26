// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(flightCrewRecordsCategoriesRepo)
const flightCrewRecordsCategoriesRepoProvider =
    FlightCrewRecordsCategoriesRepoFamily._();

final class FlightCrewRecordsCategoriesRepoProvider
    extends $FunctionalProvider<AsyncValue<Role>, Role, FutureOr<Role>>
    with $FutureModifier<Role>, $FutureProvider<Role> {
  const FlightCrewRecordsCategoriesRepoProvider._(
      {required FlightCrewRecordsCategoriesRepoFamily super.from,
      required FlightCrewRecordsCategoryFilterState super.argument})
      : super(
          retry: null,
          name: r'flightCrewRecordsCategoriesRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flightCrewRecordsCategoriesRepoHash();

  @override
  String toString() {
    return r'flightCrewRecordsCategoriesRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Role> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Role> create(Ref ref) {
    final argument = this.argument as FlightCrewRecordsCategoryFilterState;
    return flightCrewRecordsCategoriesRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordsCategoriesRepoProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$flightCrewRecordsCategoriesRepoHash() =>
    r'4a601dcc4eacde134eeeb265b0bc4284fff0dcda';

final class FlightCrewRecordsCategoriesRepoFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<Role>,
            FlightCrewRecordsCategoryFilterState> {
  const FlightCrewRecordsCategoriesRepoFamily._()
      : super(
          retry: null,
          name: r'flightCrewRecordsCategoriesRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  FlightCrewRecordsCategoriesRepoProvider call(
    FlightCrewRecordsCategoryFilterState filter,
  ) =>
      FlightCrewRecordsCategoriesRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'flightCrewRecordsCategoriesRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
