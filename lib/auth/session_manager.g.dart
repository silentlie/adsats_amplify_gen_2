// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SessionManager)
const sessionManagerProvider = SessionManagerProvider._();

final class SessionManagerProvider
    extends $AsyncNotifierProvider<SessionManager, void> {
  const SessionManagerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sessionManagerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sessionManagerHash();

  @$internal
  @override
  SessionManager create() => SessionManager();
}

String _$sessionManagerHash() => r'00fd5d33573c42bc7f3b2b41e15d1612216bbfd9';

abstract class _$SessionManager extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<void>, void>,
        AsyncValue<void>,
        Object?,
        Object?>;
    element.handleValue(ref, null);
  }
}
