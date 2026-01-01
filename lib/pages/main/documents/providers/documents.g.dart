// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(documents)
final documentsProvider = DocumentsFamily._();

final class DocumentsProvider extends $FunctionalProvider<
        AsyncValue<List<Document>>, List<Document>, FutureOr<List<Document>>>
    with $FutureModifier<List<Document>>, $FutureProvider<List<Document>> {
  DocumentsProvider._(
      {required DocumentsFamily super.from,
      required Subcategory super.argument})
      : super(
          retry: null,
          name: r'documentsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

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

String _$documentsHash() => r'b53379f21cf2f5c61925dfbf302db60c49e8e47a';

final class DocumentsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Document>>, Subcategory> {
  DocumentsFamily._()
      : super(
          retry: null,
          name: r'documentsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DocumentsProvider call(
    Subcategory subcategory,
  ) =>
      DocumentsProvider._(argument: subcategory, from: this);

  @override
  String toString() => r'documentsProvider';
}
