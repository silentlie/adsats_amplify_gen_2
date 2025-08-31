// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(records)
const recordsProvider = RecordsFamily._();

final class RecordsProvider extends $FunctionalProvider<
        AsyncValue<List<FlightCrewRecord>>,
        List<FlightCrewRecord>,
        FutureOr<List<FlightCrewRecord>>>
    with
        $FutureModifier<List<FlightCrewRecord>>,
        $FutureProvider<List<FlightCrewRecord>> {
  const RecordsProvider._(
      {required RecordsFamily super.from,
      required (
        Staff,
        FlightCrewRecordCategory,
      )
          super.argument})
      : super(
          retry: null,
          name: r'recordsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recordsHash();

  @override
  String toString() {
    return r'recordsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<FlightCrewRecord>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<FlightCrewRecord>> create(Ref ref) {
    final argument = this.argument as (
      Staff,
      FlightCrewRecordCategory,
    );
    return records(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RecordsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recordsHash() => r'780befb3a6eb36deb1f68a8eacc32f48ccf34f49';

final class RecordsFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<FlightCrewRecord>>,
            (
              Staff,
              FlightCrewRecordCategory,
            )> {
  const RecordsFamily._()
      : super(
          retry: null,
          name: r'recordsProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  RecordsProvider call(
    Staff staff,
    FlightCrewRecordCategory category,
  ) =>
      RecordsProvider._(argument: (
        staff,
        category,
      ), from: this);

  @override
  String toString() => r'recordsProvider';
}

@ProviderFor(recordMeta)
const recordMetaProvider = RecordMetaProvider._();

final class RecordMetaProvider extends $FunctionalProvider<
        AsyncValue<(Iterable<Aircraft>, Iterable<Role>)>,
        (Iterable<Aircraft>, Iterable<Role>),
        FutureOr<(Iterable<Aircraft>, Iterable<Role>)>>
    with
        $FutureModifier<(Iterable<Aircraft>, Iterable<Role>)>,
        $FutureProvider<(Iterable<Aircraft>, Iterable<Role>)> {
  const RecordMetaProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recordMetaProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
        );

  @override
  String debugGetCreateSourceHash() => _$recordMetaHash();

  @$internal
  @override
  $FutureProviderElement<(Iterable<Aircraft>, Iterable<Role>)> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<(Iterable<Aircraft>, Iterable<Role>)> create(Ref ref) {
    return recordMeta(ref);
  }
}

String _$recordMetaHash() => r'27b765291103808b69846eaee84c574e9a5ead80';

@ProviderFor(joinStaff)
const joinStaffProvider = JoinStaffFamily._();

final class JoinStaffProvider extends $FunctionalProvider<
        AsyncValue<Iterable<Staff>>, Iterable<Staff>, FutureOr<Iterable<Staff>>>
    with $FutureModifier<Iterable<Staff>>, $FutureProvider<Iterable<Staff>> {
  const JoinStaffProvider._(
      {required JoinStaffFamily super.from,
      required (
        Aircraft,
        Role,
      )
          super.argument})
      : super(
          retry: null,
          name: r'joinStaffProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$joinStaffHash();

  @override
  String toString() {
    return r'joinStaffProvider'
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
    return joinStaff(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is JoinStaffProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$joinStaffHash() => r'72ab969f4a3145d2cfb6035dbd50c2ddef7ed6e1';

final class JoinStaffFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<Iterable<Staff>>,
            (
              Aircraft,
              Role,
            )> {
  const JoinStaffFamily._()
      : super(
          retry: null,
          name: r'joinStaffProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  JoinStaffProvider call(
    Aircraft aircraft,
    Role role,
  ) =>
      JoinStaffProvider._(argument: (
        aircraft,
        role,
      ), from: this);

  @override
  String toString() => r'joinStaffProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
