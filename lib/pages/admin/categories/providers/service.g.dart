// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
          dependencies: null,
          $allTransitiveDependencies: null,
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

String _$categoriesServiceHash() => r'f4115ff3f4897654de8804b73d813150a08099ca';
