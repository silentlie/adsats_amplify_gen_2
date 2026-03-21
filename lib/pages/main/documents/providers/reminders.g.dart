// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reminders)
final remindersProvider = RemindersFamily._();

final class RemindersProvider extends $FunctionalProvider<
        AsyncValue<List<Reminder>>, List<Reminder>, FutureOr<List<Reminder>>>
    with $FutureModifier<List<Reminder>>, $FutureProvider<List<Reminder>> {
  RemindersProvider._(
      {required RemindersFamily super.from, required Document super.argument})
      : super(
          retry: null,
          name: r'remindersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$remindersHash();

  @override
  String toString() {
    return r'remindersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Reminder>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Reminder>> create(Ref ref) {
    final argument = this.argument as Document;
    return reminders(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RemindersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$remindersHash() => r'617543bf5548e8b10396be02f7c75207e7eb2764';

final class RemindersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Reminder>>, Document> {
  RemindersFamily._()
      : super(
          retry: null,
          name: r'remindersProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  RemindersProvider call(
    Document document,
  ) =>
      RemindersProvider._(argument: document, from: this);

  @override
  String toString() => r'remindersProvider';
}
