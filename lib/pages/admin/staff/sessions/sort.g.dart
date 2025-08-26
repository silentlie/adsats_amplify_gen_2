// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SessionSort)
const sessionSortProvider = SessionSortProvider._();

final class SessionSortProvider
    extends $NotifierProvider<SessionSort, SessionSortState> {
  const SessionSortProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sessionSortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sessionSortHash();

  @$internal
  @override
  SessionSort create() => SessionSort();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionSortState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionSortState>(value),
    );
  }
}

String _$sessionSortHash() => r'b7fcfd0ba4022c288910c80b1fc3541fa4827a8e';

abstract class _$SessionSort extends $Notifier<SessionSortState> {
  SessionSortState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SessionSortState, SessionSortState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SessionSortState, SessionSortState>,
        SessionSortState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
