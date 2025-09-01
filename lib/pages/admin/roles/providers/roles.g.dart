// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(roles)
const rolesProvider = RolesProvider._();

final class RolesProvider extends $FunctionalProvider<AsyncValue<List<Role>>,
        List<Role>, FutureOr<List<Role>>>
    with $FutureModifier<List<Role>>, $FutureProvider<List<Role>> {
  const RolesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'rolesProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[adminFilterProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            RolesProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = adminFilterProvider;

  @override
  String debugGetCreateSourceHash() => _$rolesHash();

  @$internal
  @override
  $FutureProviderElement<List<Role>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Role>> create(Ref ref) {
    return roles(ref);
  }
}

String _$rolesHash() => r'b0887ddd9ae9efd4b46b2712806c70d6accaaf63';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
