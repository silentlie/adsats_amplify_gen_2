// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(noticesSentRepo)
const noticesSentRepoProvider = NoticesSentRepoFamily._();

final class NoticesSentRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Notice>>, List<Notice>, FutureOr<List<Notice>>>
    with $FutureModifier<List<Notice>>, $FutureProvider<List<Notice>> {
  const NoticesSentRepoProvider._(
      {required NoticesSentRepoFamily super.from,
      required NoticeFilterState super.argument})
      : super(
          retry: null,
          name: r'noticesSentRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$noticesSentRepoHash();

  @override
  String toString() {
    return r'noticesSentRepoProvider'
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
    return noticesSentRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NoticesSentRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noticesSentRepoHash() => r'bff1de633e8f2b1e301bca0d8d376740d5428c26';

final class NoticesSentRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Notice>>, NoticeFilterState> {
  const NoticesSentRepoFamily._()
      : super(
          retry: null,
          name: r'noticesSentRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  NoticesSentRepoProvider call(
    NoticeFilterState filter,
  ) =>
      NoticesSentRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'noticesSentRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
