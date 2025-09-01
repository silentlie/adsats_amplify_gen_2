// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(subcategories)
const subcategoriesProvider = SubcategoriesFamily._();

final class SubcategoriesProvider extends $FunctionalProvider<
        AsyncValue<Category>, Category, FutureOr<Category>>
    with $FutureModifier<Category>, $FutureProvider<Category> {
  const SubcategoriesProvider._(
      {required SubcategoriesFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'subcategoriesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = subcategoryFilterProvider;

  @override
  String debugGetCreateSourceHash() => _$subcategoriesHash();

  @override
  String toString() {
    return r'subcategoriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Category> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Category> create(Ref ref) {
    final argument = this.argument as String;
    return subcategories(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SubcategoriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subcategoriesHash() => r'68db8dd15d4d8ccdf50f82cb51f0248409bb3627';

final class SubcategoriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Category>, String> {
  const SubcategoriesFamily._()
      : super(
          retry: null,
          name: r'subcategoriesProvider',
          dependencies: const <ProviderOrFamily>[subcategoryFilterProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            SubcategoriesProvider.$allTransitiveDependencies0,
          ],
          isAutoDispose: true,
        );

  SubcategoriesProvider call(
    String categoryId,
  ) =>
      SubcategoriesProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'subcategoriesProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
