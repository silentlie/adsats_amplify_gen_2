// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DocumentFilter)
const documentFilterProvider = DocumentFilterFamily._();

final class DocumentFilterProvider
    extends $NotifierProvider<DocumentFilter, DocumentFilterState> {
  const DocumentFilterProvider._(
      {required DocumentFilterFamily super.from,
      required Subcategory super.argument})
      : super(
          retry: null,
          name: r'documentFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$documentFilterHash();

  @override
  String toString() {
    return r'documentFilterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DocumentFilter create() => DocumentFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentFilterState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DocumentFilterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$documentFilterHash() => r'5b445578467b69c5a31f9f66d1769d6f044b456a';

final class DocumentFilterFamily extends $Family
    with
        $ClassFamilyOverride<DocumentFilter, DocumentFilterState,
            DocumentFilterState, DocumentFilterState, Subcategory> {
  const DocumentFilterFamily._()
      : super(
          retry: null,
          name: r'documentFilterProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DocumentFilterProvider call(
    Subcategory subcategory,
  ) =>
      DocumentFilterProvider._(argument: subcategory, from: this);

  @override
  String toString() => r'documentFilterProvider';
}

abstract class _$DocumentFilter extends $Notifier<DocumentFilterState> {
  late final _$args = ref.$arg as Subcategory;
  Subcategory get subcategory => _$args;

  DocumentFilterState build(
    Subcategory subcategory,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<DocumentFilterState, DocumentFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DocumentFilterState, DocumentFilterState>,
        DocumentFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
