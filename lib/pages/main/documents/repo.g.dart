// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(DocumentsRepo)
const documentsRepoProvider = DocumentsRepoFamily._();

final class DocumentsRepoProvider
    extends $AsyncNotifierProvider<DocumentsRepo, List<Document>> {
  const DocumentsRepoProvider._(
      {required DocumentsRepoFamily super.from,
      required DocumentFilterState super.argument})
      : super(
          retry: null,
          name: r'documentsRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$documentsRepoHash();

  @override
  String toString() {
    return r'documentsRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  DocumentsRepo create() => DocumentsRepo();

  @override
  bool operator ==(Object other) {
    return other is DocumentsRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$documentsRepoHash() => r'd1fa1425089170a3346b3dbc4aeac5472e4a1c27';

final class DocumentsRepoFamily extends $Family
    with
        $ClassFamilyOverride<DocumentsRepo, AsyncValue<List<Document>>,
            List<Document>, FutureOr<List<Document>>, DocumentFilterState> {
  const DocumentsRepoFamily._()
      : super(
          retry: null,
          name: r'documentsRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  DocumentsRepoProvider call(
    DocumentFilterState filter,
  ) =>
      DocumentsRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'documentsRepoProvider';
}

abstract class _$DocumentsRepo extends $AsyncNotifier<List<Document>> {
  late final _$args = ref.$arg as DocumentFilterState;
  DocumentFilterState get filter => _$args;

  FutureOr<List<Document>> build(
    DocumentFilterState filter,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<List<Document>>, List<Document>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Document>>, List<Document>>,
        AsyncValue<List<Document>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
