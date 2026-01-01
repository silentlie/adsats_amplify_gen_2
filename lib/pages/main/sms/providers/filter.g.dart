// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NoticeFilter)
final noticeFilterProvider = NoticeFilterProvider._();

final class NoticeFilterProvider
    extends $NotifierProvider<NoticeFilter, NoticeFilterState> {
  NoticeFilterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'noticeFilterProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$noticeFilterHash();

  @$internal
  @override
  NoticeFilter create() => NoticeFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoticeFilterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoticeFilterState>(value),
    );
  }
}

String _$noticeFilterHash() => r'79d0b1199c29fa189890a49a2a4f265fdb5876e0';

abstract class _$NoticeFilter extends $Notifier<NoticeFilterState> {
  NoticeFilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NoticeFilterState, NoticeFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NoticeFilterState, NoticeFilterState>,
        NoticeFilterState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
