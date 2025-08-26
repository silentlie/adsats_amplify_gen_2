// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CategorySort)
const categorySortProvider = CategorySortProvider._();

final class CategorySortProvider
    extends $NotifierProvider<CategorySort, CategorySortState> {
  const CategorySortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'categorySortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$categorySortHash();

  @$internal
  @override
  CategorySort create() => CategorySort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategorySortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategorySortState>(value),
    );
  }
}

String _$categorySortHash() => r'9441e2cb785c5aa4cbcd66f94d5cb29cb50bb9a5';

abstract class _$CategorySort extends $Notifier<CategorySortState> {
  CategorySortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CategorySortState, CategorySortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<CategorySortState, CategorySortState>,
        CategorySortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
