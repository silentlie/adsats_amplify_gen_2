// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(sessionsRepo)
const sessionsRepoProvider = SessionsRepoFamily._();

final class SessionsRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Session>>, List<Session>, FutureOr<List<Session>>>
    with $FutureModifier<List<Session>>, $FutureProvider<List<Session>> {
  const SessionsRepoProvider._(
      {required SessionsRepoFamily super.from, required Staff super.argument})
      : super(
          retry: null,
          name: r'sessionsRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sessionsRepoHash();

  @override
  String toString() {
    return r'sessionsRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Session>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Session>> create(Ref ref) {
    final argument = this.argument as Staff;
    return sessionsRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SessionsRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sessionsRepoHash() => r'c1b173a68386d1da70b5147eba6336774e750b0a';

final class SessionsRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Session>>, Staff> {
  const SessionsRepoFamily._()
      : super(
          retry: null,
          name: r'sessionsRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  SessionsRepoProvider call(
    Staff staff,
  ) =>
      SessionsRepoProvider._(argument: staff, from: this);

  @override
  String toString() => r'sessionsRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
