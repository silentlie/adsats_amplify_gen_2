// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(Router)
const routerProvider = RouterProvider._();

final class RouterProvider extends $NotifierProvider<Router, GoRouter> {
  const RouterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'routerProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[userIdProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            RouterProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = userIdProvider;

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  Router create() => Router();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'7c83c1d5a200b32f0a0171505f1fadf3fef7b6ea';

abstract class _$Router extends $Notifier<GoRouter> {
  GoRouter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GoRouter, GoRouter>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<GoRouter, GoRouter>, GoRouter, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
