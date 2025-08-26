// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SubcategorySort)
const subcategorySortProvider = SubcategorySortProvider._();

final class SubcategorySortProvider
    extends $NotifierProvider<SubcategorySort, SubcategorySortState> {
  const SubcategorySortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'subcategorySortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$subcategorySortHash();

  @$internal
  @override
  SubcategorySort create() => SubcategorySort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubcategorySortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubcategorySortState>(value),
    );
  }
}

String _$subcategorySortHash() => r'78ab4569d1c823ba774339013283b7e98372ccf2';

abstract class _$SubcategorySort extends $Notifier<SubcategorySortState> {
  SubcategorySortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SubcategorySortState, SubcategorySortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SubcategorySortState, SubcategorySortState>,
        SubcategorySortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
