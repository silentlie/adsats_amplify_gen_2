// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(subcategoriesRepo)
const subcategoriesRepoProvider = SubcategoriesRepoFamily._();

final class SubcategoriesRepoProvider extends $FunctionalProvider<
        AsyncValue<Category>, Category, FutureOr<Category>>
    with $FutureModifier<Category>, $FutureProvider<Category> {
  const SubcategoriesRepoProvider._(
      {required SubcategoriesRepoFamily super.from,
      required SubcategoryFilterState super.argument})
      : super(
          retry: null,
          name: r'subcategoriesRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$subcategoriesRepoHash();

  @override
  String toString() {
    return r'subcategoriesRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Category> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Category> create(Ref ref) {
    final argument = this.argument as SubcategoryFilterState;
    return subcategoriesRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SubcategoriesRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subcategoriesRepoHash() => r'720abce959e2878061c079ce35f44bfd1a8d6f56';

final class SubcategoriesRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Category>, SubcategoryFilterState> {
  const SubcategoriesRepoFamily._()
      : super(
          retry: null,
          name: r'subcategoriesRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  SubcategoriesRepoProvider call(
    SubcategoryFilterState filter,
  ) =>
      SubcategoriesRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'subcategoriesRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
