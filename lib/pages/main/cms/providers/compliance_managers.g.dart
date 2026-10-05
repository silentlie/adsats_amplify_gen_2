// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compliance_managers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(complianceManagers)
final complianceManagersProvider = ComplianceManagersProvider._();

final class ComplianceManagersProvider extends $FunctionalProvider<
        AsyncValue<List<Staff>>, List<Staff>, FutureOr<List<Staff>>>
    with $FutureModifier<List<Staff>>, $FutureProvider<List<Staff>> {
  ComplianceManagersProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'complianceManagersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$complianceManagersHash();

  @$internal
  @override
  $FutureProviderElement<List<Staff>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Staff>> create(Ref ref) {
    return complianceManagers(ref);
  }
}

String _$complianceManagersHash() =>
    r'09443a7f6339fcee6fc181bcbc2935fee307ff50';
