// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SharedPreferences)
const sharedPreferencesProvider = SharedPreferencesProvider._();

final class SharedPreferencesProvider extends $AsyncNotifierProvider<
    SharedPreferences, SharedPreferencesWithCache> {
  const SharedPreferencesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sharedPreferencesProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHash();

  @$internal
  @override
  SharedPreferences create() => SharedPreferences();
}

String _$sharedPreferencesHash() => r'3f4dffcf7c5c158ced40ff703e33ad69429a42ad';

abstract class _$SharedPreferences
    extends $AsyncNotifier<SharedPreferencesWithCache> {
  FutureOr<SharedPreferencesWithCache> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SharedPreferencesWithCache>,
        SharedPreferencesWithCache>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SharedPreferencesWithCache>,
            SharedPreferencesWithCache>,
        AsyncValue<SharedPreferencesWithCache>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
