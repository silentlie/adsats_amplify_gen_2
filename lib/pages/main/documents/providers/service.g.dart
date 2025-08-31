// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(documentsService)
const documentsServiceProvider = DocumentsServiceProvider._();

final class DocumentsServiceProvider extends $FunctionalProvider<
    DocumentsRepository,
    DocumentsRepository,
    DocumentsRepository> with $Provider<DocumentsRepository> {
  const DocumentsServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'documentsServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$documentsServiceHash();

  @$internal
  @override
  $ProviderElement<DocumentsRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DocumentsRepository create(Ref ref) {
    return documentsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentsRepository>(value),
    );
  }
}

String _$documentsServiceHash() => r'0eba49a3c7b6159ff9a1808500c91d3fb45b4739';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
