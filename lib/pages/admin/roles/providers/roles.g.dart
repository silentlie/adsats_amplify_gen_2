// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(roles)
final rolesProvider = RolesProvider._();

final class RolesProvider extends $FunctionalProvider<AsyncValue<List<Role>>,
        List<Role>, FutureOr<List<Role>>>
    with $FutureModifier<List<Role>>, $FutureProvider<List<Role>> {
  RolesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'rolesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

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

String _$rolesHash() => r'59484e4a46605485319a30d18bbc527690183a42';
