// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_reports.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allReports)
final allReportsProvider = AllReportsProvider._();

final class AllReportsProvider extends $FunctionalProvider<
        AsyncValue<List<Report>>, List<Report>, FutureOr<List<Report>>>
    with $FutureModifier<List<Report>>, $FutureProvider<List<Report>> {
  AllReportsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'allReportsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$allReportsHash();

  @$internal
  @override
  $FutureProviderElement<List<Report>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Report>> create(Ref ref) {
    return allReports(ref);
  }
}

String _$allReportsHash() => r'7b3537582fa2c4acfc4e0ef2d7bdde6c5bca01a3';
