// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(staffRepo)
const staffRepoProvider = StaffRepoFamily._();

final class StaffRepoProvider extends $FunctionalProvider<
        AsyncValue<List<Staff>>, List<Staff>, FutureOr<List<Staff>>>
    with $FutureModifier<List<Staff>>, $FutureProvider<List<Staff>> {
  const StaffRepoProvider._(
      {required StaffRepoFamily super.from,
      required AdminFilterState super.argument})
      : super(
          retry: null,
          name: r'staffRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$staffRepoHash();

  @override
  String toString() {
    return r'staffRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Staff>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Staff>> create(Ref ref) {
    final argument = this.argument as AdminFilterState;
    return staffRepo(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StaffRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$staffRepoHash() => r'5f7210ffd83d1abc7a6148a1a8cd90878cb737d5';

final class StaffRepoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Staff>>, AdminFilterState> {
  const StaffRepoFamily._()
      : super(
          retry: null,
          name: r'staffRepoProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  StaffRepoProvider call(
    AdminFilterState filter,
  ) =>
      StaffRepoProvider._(argument: filter, from: this);

  @override
  String toString() => r'staffRepoProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
