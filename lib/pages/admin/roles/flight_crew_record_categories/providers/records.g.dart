// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(flightCrewRecordCategories)
const flightCrewRecordCategoriesProvider = FlightCrewRecordCategoriesFamily._();

final class FlightCrewRecordCategoriesProvider
    extends $FunctionalProvider<AsyncValue<Role>, Role, FutureOr<Role>>
    with $FutureModifier<Role>, $FutureProvider<Role> {
  const FlightCrewRecordCategoriesProvider._(
      {required FlightCrewRecordCategoriesFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'flightCrewRecordCategoriesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 =
      flightCrewRecordCategoriesFilterProvider;

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
    r'b82f0bdc661dc02d55f0b061fe53db8d0626ee0d';

final class FlightCrewRecordCategoriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Role>, String> {
  const FlightCrewRecordCategoriesFamily._()
      : super(
          retry: null,
          name: r'flightCrewRecordCategoriesProvider',
          dependencies: const <ProviderOrFamily>[
            flightCrewRecordCategoriesFilterProvider
          ],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            FlightCrewRecordCategoriesProvider.$allTransitiveDependencies0,
          ],
          isAutoDispose: true,
        );

  FlightCrewRecordCategoriesProvider call(
    String roleId,
  ) =>
      FlightCrewRecordCategoriesProvider._(argument: roleId, from: this);

  @override
  String toString() => r'flightCrewRecordCategoriesProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
