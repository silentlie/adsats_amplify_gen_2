// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_check.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(readCheck)
const readCheckProvider = ReadCheckFamily._();

final class ReadCheckProvider extends $FunctionalProvider<
        AsyncValue<List<NoticeStaff>>,
        List<NoticeStaff>,
        FutureOr<List<NoticeStaff>>>
    with
        $FutureModifier<List<NoticeStaff>>,
        $FutureProvider<List<NoticeStaff>> {
  const ReadCheckProvider._(
      {required ReadCheckFamily super.from, required Notice super.argument})
      : super(
          retry: null,
          name: r'readCheckProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$readCheckHash();

  @override
  String toString() {
    return r'readCheckProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<NoticeStaff>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<NoticeStaff>> create(Ref ref) {
    final argument = this.argument as Notice;
    return readCheck(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReadCheckProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$readCheckHash() => r'0f2307f53779e726134ff4d193343ca4e00f05de';

final class ReadCheckFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<NoticeStaff>>, Notice> {
  const ReadCheckFamily._()
      : super(
          retry: null,
          name: r'readCheckProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ReadCheckProvider call(
    Notice notice,
  ) =>
      ReadCheckProvider._(argument: notice, from: this);

  @override
  String toString() => r'readCheckProvider';
}
