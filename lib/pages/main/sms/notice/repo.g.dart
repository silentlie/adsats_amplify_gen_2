// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(noticeRepo)
const noticeRepoProvider = NoticeRepoFamily._();

final class NoticeRepoProvider
    extends $FunctionalProvider<AsyncValue<Notice>, Notice, FutureOr<Notice>>
    with $FutureModifier<Notice>, $FutureProvider<Notice> {
  const NoticeRepoProvider._(
      {required NoticeRepoFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'noticeRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$noticeRepoHash();

  @override
  String toString() {
    return r'noticeRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Notice> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Notice> create(Ref ref) {
    final argument = this.argument as String;
    return noticeRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NoticeRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noticeRepoHash() => r'cd548f4e51d573de76b9bf38384497697c422105';

final class NoticeRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Notice>, String> {
  const NoticeRepoFamily._()
      : super(
          retry: null,
          name: r'noticeRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  NoticeRepoProvider call(
    String id,
  ) =>
      NoticeRepoProvider._(argument: id, from: this);

  @override
  String toString() => r'noticeRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
