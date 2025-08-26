// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(NoticeSort)
const noticeSortProvider = NoticeSortProvider._();

final class NoticeSortProvider
    extends $NotifierProvider<NoticeSort, NoticeSortState> {
  const NoticeSortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'noticeSortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$noticeSortHash();

  @$internal
  @override
  NoticeSort create() => NoticeSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoticeSortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoticeSortState>(value),
    );
  }
}

String _$noticeSortHash() => r'2facc24001f1c018737c0f4f00ebffd1ee70eddb';

abstract class _$NoticeSort extends $Notifier<NoticeSortState> {
  NoticeSortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NoticeSortState, NoticeSortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NoticeSortState, NoticeSortState>,
        NoticeSortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
