// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(staff)
const staffProvider = StaffProvider._();

final class StaffProvider extends $FunctionalProvider<AsyncValue<List<Staff>>,
        List<Staff>, FutureOr<List<Staff>>>
    with $FutureModifier<List<Staff>>, $FutureProvider<List<Staff>> {
  const StaffProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'staffProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[adminFilterProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            StaffProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = adminFilterProvider;

  @override
  String debugGetCreateSourceHash() => _$staffHash();

  @$internal
  @override
  $FutureProviderElement<List<Staff>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Staff>> create(Ref ref) {
    return staff(ref);
  }
}

String _$staffHash() => r'a03cd2e5567658e124ba9c0fb8202009092ffff0';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
