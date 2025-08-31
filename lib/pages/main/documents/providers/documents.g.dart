// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(documents)
const documentsProvider = DocumentsFamily._();

final class DocumentsProvider extends $FunctionalProvider<
        AsyncValue<List<Document>>, List<Document>, FutureOr<List<Document>>>
    with $FutureModifier<List<Document>>, $FutureProvider<List<Document>> {
  const DocumentsProvider._(
      {required DocumentsFamily super.from,
      required Subcategory super.argument})
      : super(
          retry: null,
          name: r'documentsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = documentFilterProvider;

  @override
  String debugGetCreateSourceHash() => _$documentsHash();

  @override
  String toString() {
    return r'documentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Document>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Document>> create(Ref ref) {
    final argument = this.argument as Subcategory;
    return documents(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DocumentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$documentsHash() => r'e1729b112f6d1a16d25df50eb1ab7b985d5f0ef5';

final class DocumentsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Document>>, Subcategory> {
  const DocumentsFamily._()
      : super(
          retry: null,
          name: r'documentsProvider',
          dependencies: const <ProviderOrFamily>[documentFilterProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            DocumentsProvider.$allTransitiveDependencies0,
          ],
          isAutoDispose: true,
        );

  DocumentsProvider call(
    Subcategory subcategory,
  ) =>
      DocumentsProvider._(argument: subcategory, from: this);

  @override
  String toString() => r'documentsProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
