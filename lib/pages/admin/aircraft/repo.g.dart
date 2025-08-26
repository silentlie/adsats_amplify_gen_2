// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(aircraftRepo)
const aircraftRepoProvider = AircraftRepoFamily._();

final class AircraftRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Aircraft>>, List<Aircraft>, FutureOr<List<Aircraft>>>
    with $FutureModifier<List<Aircraft>>, $FutureProvider<List<Aircraft>> {
  const AircraftRepoProvider._(
      {required AircraftRepoFamily super.from,
      required AdminFilterState super.argument})
      : super(
          retry: null,
          name: r'aircraftRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$aircraftRepoHash();

  @override
  String toString() {
    return r'aircraftRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Aircraft>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Aircraft>> create(Ref ref) {
    final argument = this.argument as AdminFilterState;
    return aircraftRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AircraftRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$aircraftRepoHash() => r'7387b3b2264d0ce9e2f8ad8eb7008e7c242fe043';

final class AircraftRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Aircraft>>, AdminFilterState> {
  const AircraftRepoFamily._()
      : super(
          retry: null,
          name: r'aircraftRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  AircraftRepoProvider call(
    AdminFilterState filter,
  ) =>
      AircraftRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'aircraftRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
