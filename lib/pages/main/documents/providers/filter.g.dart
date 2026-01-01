// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DocumentFilter)
final documentFilterProvider = DocumentFilterFamily._();

final class DocumentFilterProvider
    extends $NotifierProvider<DocumentFilter, DocumentFilterState> {
  DocumentFilterProvider._(
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

String _$documentFilterHash() => r'9076fa4ed8347c1a5b7b805a290c92fbaec0a08a';

final class DocumentFilterFamily extends $Family
    with
        $ClassFamilyOverride<DocumentFilter, DocumentFilterState,
            DocumentFilterState, DocumentFilterState, Subcategory> {
  DocumentFilterFamily._()
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
    final ref = this.ref as $Ref<DocumentFilterState, DocumentFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DocumentFilterState, DocumentFilterState>,
        DocumentFilterState,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
