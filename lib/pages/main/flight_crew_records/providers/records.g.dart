// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$recordsHash() => r'7c1a9f935ddcc7e55075f0a5497652c9536f9bc7';

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
          dependencies: null,
          $allTransitiveDependencies: null,
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
        AsyncValue<
            (
              Iterable<Aircraft>,
              Iterable<Role>,
            )>,
        (
          Iterable<Aircraft>,
          Iterable<Role>,
        ),
        FutureOr<
            (
              Iterable<Aircraft>,
              Iterable<Role>,
            )>>
    with
        $FutureModifier<
            (
              Iterable<Aircraft>,
              Iterable<Role>,
            )>,
        $FutureProvider<
            (
              Iterable<Aircraft>,
              Iterable<Role>,
            )> {
  const RecordMetaProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recordMetaProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recordMetaHash();

  @$internal
  @override
  $FutureProviderElement<
      (
        Iterable<Aircraft>,
        Iterable<Role>,
      )> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<
      (
        Iterable<Aircraft>,
        Iterable<Role>,
      )> create(Ref ref) {
    return recordMeta(ref);
  }
}

String _$recordMetaHash() => r'73981f373462367fbc8a1283b2c4da119c68496c';

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

String _$joinStaffHash() => r'6e400962bb0bb78003e90caed9192946872f1fdc';

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
          dependencies: null,
          $allTransitiveDependencies: null,
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
