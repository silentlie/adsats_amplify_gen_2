// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(categories)
const categoriesProvider = CategoriesProvider._();

final class CategoriesProvider extends $FunctionalProvider<
        AsyncValue<List<Category>>, List<Category>, FutureOr<List<Category>>>
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  const CategoriesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'categoriesProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[adminFilterProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            CategoriesProvider.$allTransitiveDependencies0,
          ],
        );

  static const $allTransitiveDependencies0 = adminFilterProvider;

  @override
  String debugGetCreateSourceHash() => _$categoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    return categories(ref);
  }
}

String _$categoriesHash() => r'896f36201967206d97e1be0254159557dd09b258';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
