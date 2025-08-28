// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_perferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SharedPerferences)
const sharedPerferencesProvider = SharedPerferencesProvider._();

final class SharedPerferencesProvider extends $AsyncNotifierProvider<
    SharedPerferences, SharedPreferencesWithCache> {
  const SharedPerferencesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sharedPerferencesProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sharedPerferencesHash();

  @$internal
  @override
  SharedPerferences create() => SharedPerferences();
}

String _$sharedPerferencesHash() => r'87a489ac5f39234d5f672800f78e10544797c586';

abstract class _$SharedPerferences
    extends $AsyncNotifier<SharedPreferencesWithCache> {
  FutureOr<SharedPreferencesWithCache> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SharedPreferencesWithCache>,
        SharedPreferencesWithCache>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SharedPreferencesWithCache>,
            SharedPreferencesWithCache>,
        AsyncValue<SharedPreferencesWithCache>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
