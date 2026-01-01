// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sessionsRepo)
final sessionsRepoProvider = SessionsRepoFamily._();

final class SessionsRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Session>>, List<Session>, FutureOr<List<Session>>>
    with $FutureModifier<List<Session>>, $FutureProvider<List<Session>> {
  SessionsRepoProvider._(
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

String _$sessionsRepoHash() => r'231cde923405f6235e3f74dd59504bd11cc2cdaa';

final class SessionsRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Session>>, Staff> {
  SessionsRepoFamily._()
      : super(
          retry: null,
          name: r'sessionsRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SessionsRepoProvider call(
    Staff staff,
  ) =>
      SessionsRepoProvider._(argument: staff, from: this);

  @override
  String toString() => r'sessionsRepoProvider';
}
