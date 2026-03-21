// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reminderService)
final reminderServiceProvider = ReminderServiceProvider._();

final class ReminderServiceProvider extends $FunctionalProvider<
    ReminderRepository,
    ReminderRepository,
    ReminderRepository> with $Provider<ReminderRepository> {
  ReminderServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reminderServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reminderServiceHash();

  @$internal
  @override
  $ProviderElement<ReminderRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReminderRepository create(Ref ref) {
    return reminderService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReminderRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReminderRepository>(value),
    );
  }
}

String _$reminderServiceHash() => r'234f9f6b8b7e038018fe659ac46996543d7e6176';
