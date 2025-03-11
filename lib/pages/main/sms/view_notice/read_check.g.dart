// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_check.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$readCheckHash() => r'39d85dac27fd9892b99279456b5688c8929c887a';

/// See also [readCheck].
@ProviderFor(readCheck)
final readCheckProvider = AutoDisposeFutureProvider<List<NoticeStaff>>.internal(
  readCheck,
  name: r'readCheckProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$readCheckHash,
  dependencies: <ProviderOrFamily>[
    userIdProvider,
    noticeNotifierProvider,
    listNoticeStaffProvider
  ],
  allTransitiveDependencies: <ProviderOrFamily>{
    userIdProvider,
    ...?userIdProvider.allTransitiveDependencies,
    noticeNotifierProvider,
    ...?noticeNotifierProvider.allTransitiveDependencies,
    listNoticeStaffProvider,
    ...?listNoticeStaffProvider.allTransitiveDependencies
  },
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReadCheckRef = AutoDisposeFutureProviderRef<List<NoticeStaff>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
