// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_files.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedFiles)
const selectedFilesProvider = SelectedFilesProvider._();

final class SelectedFilesProvider
    extends $NotifierProvider<SelectedFiles, List<PlatformFile>> {
  const SelectedFilesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'selectedFilesProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
        );

  @override
  String debugGetCreateSourceHash() => _$selectedFilesHash();

  @$internal
  @override
  SelectedFiles create() => SelectedFiles();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PlatformFile> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PlatformFile>>(value),
    );
  }
}

String _$selectedFilesHash() => r'45a39146ba4e200235ef7649ced84df839d07455';

abstract class _$SelectedFiles extends $Notifier<List<PlatformFile>> {
  List<PlatformFile> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<PlatformFile>, List<PlatformFile>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<PlatformFile>, List<PlatformFile>>,
        List<PlatformFile>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
