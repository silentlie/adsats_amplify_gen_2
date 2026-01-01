// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notice)
final noticeProvider = NoticeFamily._();

final class NoticeProvider
    extends $FunctionalProvider<AsyncValue<Notice>, Notice, FutureOr<Notice>>
    with $FutureModifier<Notice>, $FutureProvider<Notice> {
  NoticeProvider._(
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

String _$noticeHash() => r'66774b705b5bdbf4738474946e5db6714d701ebd';

final class NoticeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Notice>, String> {
  NoticeFamily._()
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
