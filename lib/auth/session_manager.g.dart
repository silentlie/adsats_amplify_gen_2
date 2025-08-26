// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
          dependencies: const <ProviderOrFamily>[userDetailsProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            SessionManagerProvider.$allTransitiveDependencies0,
            SessionManagerProvider.$allTransitiveDependencies1,
          ],
        );

  static const $allTransitiveDependencies0 = userDetailsProvider;
  static const $allTransitiveDependencies1 =
      UserDetailsProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$sessionManagerHash();

  @$internal
  @override
  SessionManager create() => SessionManager();
}

String _$sessionManagerHash() => r'9e2b93672362e3fc66d6f41b3962a3cc074867ef';

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

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
