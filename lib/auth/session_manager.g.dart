// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionManagerHash() => r'9e2b93672362e3fc66d6f41b3962a3cc074867ef';

/// See also [SessionManager].
@ProviderFor(SessionManager)
final sessionManagerProvider =
    AutoDisposeAsyncNotifierProvider<SessionManager, void>.internal(
  SessionManager.new,
  name: r'sessionManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionManagerHash,
  dependencies: <ProviderOrFamily>[userDetailsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    userDetailsProvider,
    ...?userDetailsProvider.allTransitiveDependencies
  },
);

typedef _$SessionManager = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
