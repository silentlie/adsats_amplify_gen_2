// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(flightCrewRecordCategories)
final flightCrewRecordCategoriesProvider = FlightCrewRecordCategoriesFamily._();

final class FlightCrewRecordCategoriesProvider
    extends $FunctionalProvider<AsyncValue<Role>, Role, FutureOr<Role>>
    with $FutureModifier<Role>, $FutureProvider<Role> {
  FlightCrewRecordCategoriesProvider._(
      {required FlightCrewRecordCategoriesFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'flightCrewRecordCategoriesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flightCrewRecordCategoriesHash();

  @override
  String toString() {
    return r'flightCrewRecordCategoriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Role> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Role> create(Ref ref) {
    final argument = this.argument as String;
    return flightCrewRecordCategories(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FlightCrewRecordCategoriesProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$flightCrewRecordCategoriesHash() =>
    r'77273cbf65b674caacf037896e22786374cb2554';

final class FlightCrewRecordCategoriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Role>, String> {
  FlightCrewRecordCategoriesFamily._()
      : super(
          retry: null,
          name: r'flightCrewRecordCategoriesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FlightCrewRecordCategoriesProvider call(
    String roleId,
  ) =>
      FlightCrewRecordCategoriesProvider._(argument: roleId, from: this);

  @override
  String toString() => r'flightCrewRecordCategoriesProvider';
}
