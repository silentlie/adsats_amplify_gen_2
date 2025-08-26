// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DocumentSort)
const documentSortProvider = DocumentSortProvider._();

final class DocumentSortProvider
    extends $NotifierProvider<DocumentSort, DocumentSortState> {
  const DocumentSortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'documentSortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$documentSortHash();

  @$internal
  @override
  DocumentSort create() => DocumentSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentSortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentSortState>(value),
    );
  }
}

String _$documentSortHash() => r'a631babcc78355a6133459cdae9cd2668e970abe';

abstract class _$DocumentSort extends $Notifier<DocumentSortState> {
  DocumentSortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DocumentSortState, DocumentSortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<DocumentSortState, DocumentSortState>,
        DocumentSortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
