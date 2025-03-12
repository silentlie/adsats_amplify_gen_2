// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noticeNotifierHash() => r'cb92066aa225d935d8180e4e81be5a496224a92e';

/// See also [NoticeNotifier].
@ProviderFor(NoticeNotifier)
final noticeNotifierProvider =
    AutoDisposeNotifierProvider<NoticeNotifier, NoticeState>.internal(
  NoticeNotifier.new,
  name: r'noticeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$noticeNotifierHash,
  dependencies: <ProviderOrFamily>[
    selectedFilesProvider,
    isSafetyOfficerProvider,
    userDetailsProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    selectedFilesProvider,
    ...?selectedFilesProvider.allTransitiveDependencies,
    isSafetyOfficerProvider,
    ...?isSafetyOfficerProvider.allTransitiveDependencies,
    userDetailsProvider,
    ...?userDetailsProvider.allTransitiveDependencies
  },
);

typedef _$NoticeNotifier = AutoDisposeNotifier<NoticeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
