// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(notice)
const noticeProvider = NoticeFamily._();

final class NoticeProvider
    extends $FunctionalProvider<AsyncValue<Notice>, Notice, FutureOr<Notice>>
    with $FutureModifier<Notice>, $FutureProvider<Notice> {
  const NoticeProvider._(
      {required NoticeFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'noticeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$noticeHash();

  @override
  String toString() {
    return r'noticeProvider'
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
    return notice(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NoticeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noticeHash() => r'98ba16a95a7084bbcab57ca0c87c1bc24d9c4a0b';

final class NoticeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Notice>, String> {
  const NoticeFamily._()
      : super(
          retry: null,
          name: r'noticeProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  NoticeProvider call(
    String id,
  ) =>
      NoticeProvider._(argument: id, from: this);

  @override
  String toString() => r'noticeProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
