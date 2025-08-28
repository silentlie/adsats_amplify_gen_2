// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(categoriesRepo)
const categoriesRepoProvider = CategoriesRepoFamily._();

final class CategoriesRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Category>>, List<Category>, FutureOr<List<Category>>>
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  const CategoriesRepoProvider._(
      {required CategoriesRepoFamily super.from,
      required AdminFilterState super.argument})
      : super(
          retry: null,
          name: r'categoriesRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$categoriesRepoHash();

  @override
  String toString() {
    return r'categoriesRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    final argument = this.argument as AdminFilterState;
    return categoriesRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoriesRepoHash() => r'339fc24e13cf5abc1a7baa322277a317a0f33989';

final class CategoriesRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Category>>, AdminFilterState> {
  const CategoriesRepoFamily._()
      : super(
          retry: null,
          name: r'categoriesRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  CategoriesRepoProvider call(
    AdminFilterState filter,
  ) =>
      CategoriesRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'categoriesRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
