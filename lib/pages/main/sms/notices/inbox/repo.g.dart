// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(noticesInboxRepo)
const noticesInboxRepoProvider = NoticesInboxRepoFamily._();

final class NoticesInboxRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Notice>>, List<Notice>, FutureOr<List<Notice>>>
    with $FutureModifier<List<Notice>>, $FutureProvider<List<Notice>> {
  const NoticesInboxRepoProvider._(
      {required NoticesInboxRepoFamily super.from,
      required NoticeFilterState super.argument})
      : super(
          retry: null,
          name: r'noticesInboxRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = listNoticeStaffProvider;

  @override
  String debugGetCreateSourceHash() => _$noticesInboxRepoHash();

  @override
  String toString() {
    return r'noticesInboxRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Notice>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Notice>> create(Ref ref) {
    final argument = this.argument as NoticeFilterState;
    return noticesInboxRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NoticesInboxRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noticesInboxRepoHash() => r'cb997a034097d8e5f0752d9d0387f3c6e80f6fd6';

final class NoticesInboxRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Notice>>, NoticeFilterState> {
  const NoticesInboxRepoFamily._()
      : super(
          retry: null,
          name: r'noticesInboxRepoProvider',
          dependencies: const <ProviderOrFamily>[listNoticeStaffProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            NoticesInboxRepoProvider.$allTransitiveDependencies0,
          ],
          isAutoDispose: true,
        );

  NoticesInboxRepoProvider call(
    NoticeFilterState filter,
  ) =>
      NoticesInboxRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'noticesInboxRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
