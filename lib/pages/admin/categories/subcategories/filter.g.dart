// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SubcategoryFilter)
const subcategoryFilterProvider = SubcategoryFilterFamily._();

final class SubcategoryFilterProvider
    extends $NotifierProvider<SubcategoryFilter, SubcategoryFilterState> {
  const SubcategoryFilterProvider._(
      {required SubcategoryFilterFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'subcategoryFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$subcategoryFilterHash();

  @override
  String toString() {
    return r'subcategoryFilterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SubcategoryFilter create() => SubcategoryFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubcategoryFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubcategoryFilterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SubcategoryFilterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subcategoryFilterHash() => r'e9116be248e7405ffa2946dca4c7cfa236ffb0de';

final class SubcategoryFilterFamily extends $Family
    with
        $ClassFamilyOverride<SubcategoryFilter, SubcategoryFilterState,
            SubcategoryFilterState, SubcategoryFilterState, String> {
  const SubcategoryFilterFamily._()
      : super(
          retry: null,
          name: r'subcategoryFilterProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  SubcategoryFilterProvider call(
    String categoryId,
  ) =>
      SubcategoryFilterProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'subcategoryFilterProvider';
}

abstract class _$SubcategoryFilter extends $Notifier<SubcategoryFilterState> {
  late final _$args = ref.$arg as String;
  String get categoryId => _$args;

  SubcategoryFilterState build(
    String categoryId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref =
        this.ref as $Ref<SubcategoryFilterState, SubcategoryFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SubcategoryFilterState, SubcategoryFilterState>,
        SubcategoryFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
