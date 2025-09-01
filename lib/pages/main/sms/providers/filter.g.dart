// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(NoticeFilter)
const noticeFilterProvider = NoticeFilterProvider._();

final class NoticeFilterProvider
    extends $NotifierProvider<NoticeFilter, NoticeFilterState> {
  const NoticeFilterProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'noticeFilterProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[userDetailsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            NoticeFilterProvider.$allTransitiveDependencies0,
            NoticeFilterProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = userDetailsProvider;
  static const $allTransitiveDependencies1 =
      UserDetailsProvider.$allTransitiveDependencies0;

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

String _$noticeFilterHash() => r'9b84ce46ce40ff5f6eda426cd416b03937aa9a63';

abstract class _$NoticeFilter extends $Notifier<NoticeFilterState> {
  NoticeFilterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NoticeFilterState, NoticeFilterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NoticeFilterState, NoticeFilterState>,
        NoticeFilterState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
