// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(ReportNotifier)
const reportNotifierProvider = ReportNotifierProvider._();

final class ReportNotifierProvider
    extends $NotifierProvider<ReportNotifier, ReportState> {
  const ReportNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reportNotifierProvider',
          isAutoDispose: true,
          dependencies: const <ProviderOrFamily>[
            selectedFilesProvider,
            isComplianceManagerProvider,
            userDetailsProvider
          ],
          $allTransitiveDependencies: const <ProviderOrFamily>{
            ReportNotifierProvider.$allTransitiveDependencies0,
            ReportNotifierProvider.$allTransitiveDependencies1,
            ReportNotifierProvider.$allTransitiveDependencies2,
            ReportNotifierProvider.$allTransitiveDependencies3,
          },
        );

  static const $allTransitiveDependencies0 = selectedFilesProvider;
  static const $allTransitiveDependencies1 = isComplianceManagerProvider;
  static const $allTransitiveDependencies2 =
      IsComplianceManagerProvider.$allTransitiveDependencies0;
  static const $allTransitiveDependencies3 =
      IsComplianceManagerProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$reportNotifierHash();

  @$internal
  @override
  ReportNotifier create() => ReportNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportState>(value),
    );
  }
}

String _$reportNotifierHash() => r'98073a745c6d0067ac43a838fa0ecb16c179b0d5';

abstract class _$ReportNotifier extends $Notifier<ReportState> {
  ReportState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReportState, ReportState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ReportState, ReportState>, ReportState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(staffByRoleName)
const staffByRoleNameProvider = StaffByRoleNameFamily._();

final class StaffByRoleNameProvider extends $FunctionalProvider<
        AsyncValue<List<Staff>>, List<Staff>, FutureOr<List<Staff>>>
    with $FutureModifier<List<Staff>>, $FutureProvider<List<Staff>> {
  const StaffByRoleNameProvider._(
      {required StaffByRoleNameFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'staffByRoleNameProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$staffByRoleNameHash();

  @override
  String toString() {
    return r'staffByRoleNameProvider'
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
    final argument = this.argument as String;
    return staffByRoleName(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StaffByRoleNameProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$staffByRoleNameHash() => r'17c8873037db96189e4df888667e312df0472305';

final class StaffByRoleNameFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Staff>>, String> {
  const StaffByRoleNameFamily._()
      : super(
          retry: null,
          name: r'staffByRoleNameProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  StaffByRoleNameProvider call(
    String roleName,
  ) =>
      StaffByRoleNameProvider._(argument: roleName, from: this);

  @override
  String toString() => r'staffByRoleNameProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
