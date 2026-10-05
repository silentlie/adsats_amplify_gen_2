// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(staff)
final staffProvider = StaffProvider._();

final class StaffProvider extends $FunctionalProvider<AsyncValue<List<Staff>>,
        List<Staff>, FutureOr<List<Staff>>>
    with $FutureModifier<List<Staff>>, $FutureProvider<List<Staff>> {
  StaffProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'staffProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$staffHash();

  @$internal
  @override
  $FutureProviderElement<List<Staff>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Staff>> create(Ref ref) {
    return staff(ref);
  }
}

String _$staffHash() => r'31d4ee3ef2d2ff04c9bf064bce0ccb8af9963430';
