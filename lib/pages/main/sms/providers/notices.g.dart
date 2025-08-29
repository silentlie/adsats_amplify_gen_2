// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notices.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(notices)
const noticesProvider = NoticesFamily._();

final class NoticesProvider extends $FunctionalProvider<
        AsyncValue<List<Notice>>, List<Notice>, FutureOr<List<Notice>>>
    with $FutureModifier<List<Notice>>, $FutureProvider<List<Notice>> {
  const NoticesProvider._(
      {required NoticesFamily super.from, required InboxOrSent super.argument})
      : super(
          retry: null,
          name: r'noticesProvider',
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
  String debugGetCreateSourceHash() => _$noticesHash();

  @override
  String toString() {
    return r'noticesProvider'
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
    final argument = this.argument as InboxOrSent;
    return notices(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NoticesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noticesHash() => r'24188f6f2871ea26bb31e5659f7c75276dabf3f3';

final class NoticesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Notice>>, InboxOrSent> {
  const NoticesFamily._()
      : super(
          retry: null,
          name: r'noticesProvider',
          dependencies: const <ProviderOrFamily>[noticeFilterProvider],
          $allTransitiveDependencies: const <ProviderOrFamily>[
            NoticesProvider.$allTransitiveDependencies0,
            NoticesProvider.$allTransitiveDependencies1,
            NoticesProvider.$allTransitiveDependencies2,
          ],
          isAutoDispose: true,
        );

  NoticesProvider call(
    InboxOrSent type,
  ) =>
      NoticesProvider._(argument: type, from: this);

  @override
  String toString() => r'noticesProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
