// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(categoriesService)
const categoriesServiceProvider = CategoriesServiceProvider._();

final class CategoriesServiceProvider extends $FunctionalProvider<
    CategoriesRepository,
    CategoriesRepository,
    CategoriesRepository> with $Provider<CategoriesRepository> {
  const CategoriesServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'categoriesServiceProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
        );

  @override
  String debugGetCreateSourceHash() => _$categoriesServiceHash();

  @$internal
  @override
  $ProviderElement<CategoriesRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CategoriesRepository create(Ref ref) {
    return categoriesService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoriesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoriesRepository>(value),
    );
  }
}

String _$categoriesServiceHash() => r'7d3b71e8670e003cc991760a6cf8533c274b6888';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
