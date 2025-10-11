// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$subcategoriesHash() => r'00b098398364f2606d0db16ae9fd9fb3d4044563';

final class SubcategoriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Category>, String> {
  const SubcategoriesFamily._()
      : super(
          retry: null,
          name: r'subcategoriesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SubcategoriesProvider call(
    String categoryId,
  ) =>
      SubcategoriesProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'subcategoriesProvider';
}
