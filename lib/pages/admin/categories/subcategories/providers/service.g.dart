// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(subcategoriesService)
const subcategoriesServiceProvider = SubcategoriesServiceProvider._();

final class SubcategoriesServiceProvider extends $FunctionalProvider<
    SubcategoriesRepository,
    SubcategoriesRepository,
    SubcategoriesRepository> with $Provider<SubcategoriesRepository> {
  const SubcategoriesServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'subcategoriesServiceProvider',
          isAutoDispose: false,
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
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
    r'7901c0da0113e31b39b1b2a0619bf41073025b41';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
