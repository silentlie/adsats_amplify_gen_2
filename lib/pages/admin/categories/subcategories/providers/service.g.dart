// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(subcategoriesService)
final subcategoriesServiceProvider = SubcategoriesServiceProvider._();

final class SubcategoriesServiceProvider extends $FunctionalProvider<
    SubcategoriesRepository,
    SubcategoriesRepository,
    SubcategoriesRepository> with $Provider<SubcategoriesRepository> {
  SubcategoriesServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'subcategoriesServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$subcategoriesServiceHash();

  @$internal
  @override
  $ProviderElement<SubcategoriesRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SubcategoriesRepository create(Ref ref) {
    return subcategoriesService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubcategoriesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubcategoriesRepository>(value),
    );
  }
}

String _$subcategoriesServiceHash() =>
    r'cec646929b981d6635f34850168dde3e9f0b3aaf';
