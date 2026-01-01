// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubcategoryFilter)
final subcategoryFilterProvider = SubcategoryFilterFamily._();

final class SubcategoryFilterProvider
    extends $NotifierProvider<SubcategoryFilter, SubcategoryFilterState> {
  SubcategoryFilterProvider._(
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

String _$subcategoryFilterHash() => r'39b61f4e4ccdbde4a6837ac512720cb828f08036';

final class SubcategoryFilterFamily extends $Family
    with
        $ClassFamilyOverride<SubcategoryFilter, SubcategoryFilterState,
            SubcategoryFilterState, SubcategoryFilterState, String> {
  SubcategoryFilterFamily._()
      : super(
          retry: null,
          name: r'subcategoryFilterProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
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
    final ref =
        this.ref as $Ref<SubcategoryFilterState, SubcategoryFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SubcategoryFilterState, SubcategoryFilterState>,
        SubcategoryFilterState,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
