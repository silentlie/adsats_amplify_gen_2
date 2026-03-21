// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reports)
final reportsProvider = ReportsFamily._();

final class ReportsProvider extends $FunctionalProvider<
        AsyncValue<List<Report>>, List<Report>, FutureOr<List<Report>>>
    with $FutureModifier<List<Report>>, $FutureProvider<List<Report>> {
  ReportsProvider._(
      {required ReportsFamily super.from, required Scope super.argument})
      : super(
          retry: null,
          name: r'reportsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reportsHash();

  @override
  String toString() {
    return r'reportsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Report>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Report>> create(Ref ref) {
    final argument = this.argument as Scope;
    return reports(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReportsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportsHash() => r'e1945b79c5f1f6dc68878b2ff62049fb95a45ff5';

final class ReportsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Report>>, Scope> {
  ReportsFamily._()
      : super(
          retry: null,
          name: r'reportsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ReportsProvider call(
    Scope type,
  ) =>
      ReportsProvider._(argument: type, from: this);

  @override
  String toString() => r'reportsProvider';
}
