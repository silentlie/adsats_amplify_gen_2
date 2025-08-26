// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(flightCrewRecordsRepo)
const flightCrewRecordsRepoProvider = FlightCrewRecordsRepoFamily._();

final class FlightCrewRecordsRepoProvider extends $FunctionalProvider<
        AsyncValue<List<FlightCrewRecord>>,
        List<FlightCrewRecord>,
        FutureOr<List<FlightCrewRecord>>>
    with
        $FutureModifier<List<FlightCrewRecord>>,
        $FutureProvider<List<FlightCrewRecord>> {
  const FlightCrewRecordsRepoProvider._(
      {required FlightCrewRecordsRepoFamily super.from,
      required FlightCrewRecordFilterState super.argument})
      : super(
          retry: null,
          name: r'flightCrewRecordsRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flightCrewRecordsRepoHash();

  @override
  String toString() {
    return r'flightCrewRecordsRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<FlightCrewRecord>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<FlightCrewRecord>> create(Ref ref) {
    final argument = this.argument as FlightCrewRecordFilterState;
    return flightCrewRecordsRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordsRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$flightCrewRecordsRepoHash() =>
    r'40c7d90b2cc7b664b829b91d17b8e95a5ac753d2';

final class FlightCrewRecordsRepoFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<FlightCrewRecord>>,
            FlightCrewRecordFilterState> {
  const FlightCrewRecordsRepoFamily._()
      : super(
          retry: null,
          name: r'flightCrewRecordsRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  FlightCrewRecordsRepoProvider call(
    FlightCrewRecordFilterState filter,
  ) =>
      FlightCrewRecordsRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'flightCrewRecordsRepoProvider';
}

@ProviderFor(flightCrewRecordsMeta)
const flightCrewRecordsMetaProvider = FlightCrewRecordsMetaProvider._();

final class FlightCrewRecordsMetaProvider extends $FunctionalProvider<
        AsyncValue<(Iterable<Aircraft>, Iterable<Role>)>,
        (Iterable<Aircraft>, Iterable<Role>),
        FutureOr<(Iterable<Aircraft>, Iterable<Role>)>>
    with
        $FutureModifier<(Iterable<Aircraft>, Iterable<Role>)>,
        $FutureProvider<(Iterable<Aircraft>, Iterable<Role>)> {
  const FlightCrewRecordsMetaProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'flightCrewRecordsMetaProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[userDetailsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            FlightCrewRecordsMetaProvider.$allTransitiveDependencies0,
            FlightCrewRecordsMetaProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = userDetailsProvider;
  static const $allTransitiveDependencies1 =
      UserDetailsProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$flightCrewRecordsMetaHash();

  @$internal
  @override
  $FutureProviderElement<(Iterable<Aircraft>, Iterable<Role>)> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<(Iterable<Aircraft>, Iterable<Role>)> create(Ref ref) {
    return flightCrewRecordsMeta(ref);
  }
}

String _$flightCrewRecordsMetaHash() =>
    r'e224d28dce8fea55195a821307c3115804e7c030';

@ProviderFor(listJoinStaff)
const listJoinStaffProvider = ListJoinStaffFamily._();

final class ListJoinStaffProvider extends $FunctionalProvider<
        AsyncValue<Iterable<Staff>>, Iterable<Staff>, FutureOr<Iterable<Staff>>>
    with $FutureModifier<Iterable<Staff>>, $FutureProvider<Iterable<Staff>> {
  const ListJoinStaffProvider._(
      {required ListJoinStaffFamily super.from,
      required (
        Aircraft,
        Role,
      )
          super.argument})
      : super(
          retry: null,
          name: r'listJoinStaffProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$listJoinStaffHash();

  @override
  String toString() {
    return r'listJoinStaffProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Iterable<Staff>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Iterable<Staff>> create(Ref ref) {
    final argument = this.argument as (
      Aircraft,
      Role,
    );
    return listJoinStaff(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListJoinStaffProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listJoinStaffHash() => r'c89875fef6688c520359c87a4e47fd7a603b85fa';

final class ListJoinStaffFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<Iterable<Staff>>,
            (
              Aircraft,
              Role,
            )> {
  const ListJoinStaffFamily._()
      : super(
          retry: null,
          name: r'listJoinStaffProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListJoinStaffProvider call(
    Aircraft aircraft,
    Role role,
  ) =>
      ListJoinStaffProvider._(argument: (
        aircraft,
        role,
      ), from: this);

  @override
  String toString() => r'listJoinStaffProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
