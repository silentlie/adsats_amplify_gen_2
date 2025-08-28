// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(NoticeRepository)
const noticeRepositoryProvider = NoticeRepositoryFamily._();

final class NoticeRepositoryProvider
    extends $AsyncNotifierProvider<NoticeRepository, List<Notice>> {
  const NoticeRepositoryProvider._(
      {required NoticeRepositoryFamily super.from,
      required InboxOrSent super.argument})
      : super(
          retry: null,
          name: r'noticeRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  static const $allTransitiveDependencies0 = noticeFilterProvider;
  static const $allTransitiveDependencies1 =
      NoticeFilterProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies2 =
      NoticeFilterProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$noticeRepositoryHash();

  @override
  String toString() {
    return r'noticeRepositoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NoticeRepository create() => NoticeRepository();

  @override
  bool operator ==(Object other) {
    return other is NoticeRepositoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noticeRepositoryHash() => r'b676d741b9cdd895b0e36cccf1e98483d8ded28c';

final class NoticeRepositoryFamily extends $Family
    with
        $ClassFamilyOverride<NoticeRepository, AsyncValue<List<Notice>>,
            List<Notice>, FutureOr<List<Notice>>, InboxOrSent> {
  const NoticeRepositoryFamily._()
      : super(
          retry: null,
          name: r'noticeRepositoryProvider',
          dependencies: const <ProviderOrFamily>[noticeFilterProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            NoticeRepositoryProvider.$allTransitiveDependencies0,
            NoticeRepositoryProvider.$allTransitiveDependencies1,
            NoticeRepositoryProvider.$allTransitiveDependencies2,
          ],
          isAutoDispose: true,
        );

  NoticeRepositoryProvider call(
    InboxOrSent type,
  ) =>
      NoticeRepositoryProvider._(argument: type, from: this);

  @override
  String toString() => r'noticeRepositoryProvider';
}

abstract class _$NoticeRepository extends $AsyncNotifier<List<Notice>> {
  late final _$args = ref.$arg as InboxOrSent;
  InboxOrSent get type => _$args;

  FutureOr<List<Notice>> build(
    InboxOrSent type,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<List<Notice>>, List<Notice>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Notice>>, List<Notice>>,
        AsyncValue<List<Notice>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
