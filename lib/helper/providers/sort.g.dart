// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(Sort)
const sortProvider = SortFamily._();

final class SortProvider<T> extends $NotifierProvider<Sort<T>, SortState<T>> {
  const SortProvider._({required SortFamily super.from})
      : super(
          argument: null,
          retry: null,
          name: r'sortProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sortHash();

  @override
  String toString() {
    return r'sortProvider'
        '<${T}>'
        '()';
  }

  @$internal
  @override
  Sort<T> create() => Sort<T>();

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SortState<T> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SortState<T>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SortProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$sortHash() => r'b5f9968828dff1b355baa903d176b15a982f369e';

final class SortFamily extends $Family {
  const SortFamily._()
      : super(
          retry: null,
          name: r'sortProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SortProvider<T> call<T>() => SortProvider<T>._(from: this);

  @override
  String toString() => r'sortProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(Sort<T> Function<T>() create) => $FamilyOverride(
      from: this,
      createElement: (pointer) {
        final provider = pointer.origin as SortProvider;
        return provider._captureGenerics(<T>() {
          provider as SortProvider<T>;
          return provider.$view(create: create<T>).$createElement(pointer);
        });
      });

  /// {@macro riverpod.override_with_build}
  Override overrideWithBuild(
          SortState<T> Function<T>(Ref ref, Sort<T> notifier) build) =>
      $FamilyOverride(
          from: this,
          createElement: (pointer) {
            final provider = pointer.origin as SortProvider;
            return provider._captureGenerics(<T>() {
              provider as SortProvider<T>;
              return provider
                  .$view(runNotifierBuildOverride: build<T>)
                  .$createElement(pointer);
            });
          });
}

abstract class _$Sort<T> extends $Notifier<SortState<T>> {
  SortState<T> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SortState<T>, SortState<T>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SortState<T>, SortState<T>>,
        SortState<T>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
