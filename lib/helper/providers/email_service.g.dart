// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(emailService)
final emailServiceProvider = EmailServiceProvider._();

final class EmailServiceProvider extends $FunctionalProvider<
    AmplifyEmailRepository,
    AmplifyEmailRepository,
    AmplifyEmailRepository> with $Provider<AmplifyEmailRepository> {
  EmailServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'emailServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$emailServiceHash();

  @$internal
  @override
  $ProviderElement<AmplifyEmailRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AmplifyEmailRepository create(Ref ref) {
    return emailService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AmplifyEmailRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AmplifyEmailRepository>(value),
    );
  }
}

String _$emailServiceHash() => r'ce6981e4f8ecd22afeb24b151463f9ebef16e1b0';
