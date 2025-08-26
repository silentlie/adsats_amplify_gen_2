// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(rolesRepo)
const rolesRepoProvider = RolesRepoFamily._();

final class RolesRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Role>>, List<Role>, FutureOr<List<Role>>>
    with $FutureModifier<List<Role>>, $FutureProvider<List<Role>> {
  const RolesRepoProvider._(
      {required RolesRepoFamily super.from,
      required AdminFilterState super.argument})
      : super(
          retry: null,
          name: r'rolesRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$rolesRepoHash();

  @override
  String toString() {
    return r'rolesRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Role>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Role>> create(Ref ref) {
    final argument = this.argument as AdminFilterState;
    return rolesRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RolesRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$rolesRepoHash() => r'b31d31bca8be9313f28178d7bb1c22d2b7b199a0';

final class RolesRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Role>>, AdminFilterState> {
  const RolesRepoFamily._()
      : super(
          retry: null,
          name: r'rolesRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  RolesRepoProvider call(
    AdminFilterState filter,
  ) =>
      RolesRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'rolesRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
