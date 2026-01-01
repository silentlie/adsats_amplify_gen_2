// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notices.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notices)
final noticesProvider = NoticesFamily._();

final class NoticesProvider extends $FunctionalProvider<
        AsyncValue<List<Notice>>, List<Notice>, FutureOr<List<Notice>>>
    with $FutureModifier<List<Notice>>, $FutureProvider<List<Notice>> {
  NoticesProvider._(
      {required NoticesFamily super.from, required InboxOrSent super.argument})
      : super(
          retry: null,
          name: r'noticesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

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

String _$noticesHash() => r'9a393942e328be297efc0410e6a3bb624be0a5f1';

final class NoticesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Notice>>, InboxOrSent> {
  NoticesFamily._()
      : super(
          retry: null,
          name: r'noticesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  NoticesProvider call(
    InboxOrSent type,
  ) =>
      NoticesProvider._(argument: type, from: this);

  @override
  String toString() => r'noticesProvider';
}
