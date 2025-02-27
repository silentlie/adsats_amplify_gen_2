// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noticeFilterHash() => r'a0e11dcba531fa67df842367016729136917998a';

/// See also [NoticeFilter].
@ProviderFor(NoticeFilter)
final noticeFilterProvider =
    AutoDisposeNotifierProvider<NoticeFilter, NoticeFilterState>.internal(
  NoticeFilter.new,
  name: r'noticeFilterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$noticeFilterHash,
  dependencies: <ProviderOrFamily>[userDetailsProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    userDetailsProvider,
    ...?userDetailsProvider.allTransitiveDependencies
  },
);

typedef _$NoticeFilter = AutoDisposeNotifier<NoticeFilterState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
