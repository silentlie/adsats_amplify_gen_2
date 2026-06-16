// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reportService)
final reportServiceProvider = ReportServiceProvider._();

final class ReportServiceProvider extends $FunctionalProvider<ReportRepository,
    ReportRepository, ReportRepository> with $Provider<ReportRepository> {
  ReportServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reportServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reportServiceHash();

  @$internal
  @override
  $ProviderElement<ReportRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReportRepository create(Ref ref) {
    return reportService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportRepository>(value),
    );
  }
}

String _$reportServiceHash() => r'1fcb32ef702c5c50e310a2309fd190ebce65f750';
