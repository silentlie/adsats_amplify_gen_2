// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(emailService)
const emailServiceProvider = EmailServiceProvider._();

final class EmailServiceProvider extends $FunctionalProvider<
    AmplifyEmailRepository,
    AmplifyEmailRepository,
    AmplifyEmailRepository> with $Provider<AmplifyEmailRepository> {
  const EmailServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'emailServiceProvider',
          isAutoDispose: true,
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

String _$emailServiceHash() => r'3dea5b2de75d11c5452245cea28acb18349c8f6f';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
