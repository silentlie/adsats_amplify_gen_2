// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listStaff)
final listStaffProvider = ListStaffFamily._();

final class ListStaffProvider extends $FunctionalProvider<
        AsyncValue<List<Staff>>, List<Staff>, FutureOr<List<Staff>>>
    with $FutureModifier<List<Staff>>, $FutureProvider<List<Staff>> {
  ListStaffProvider._(
      {required ListStaffFamily super.from,
      required QueryPredicate<Model>? super.argument})
      : super(
          retry: null,
          name: r'listStaffProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$listStaffHash();

  @override
  String toString() {
    return r'listStaffProvider'
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
    final argument = this.argument as QueryPredicate<Model>?;
    return listStaff(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListStaffProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listStaffHash() => r'c3efd2a70862e1d6cc8d0c032e72de50c640bb39';

final class ListStaffFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<Staff>>,
            QueryPredicate<Model>?> {
  ListStaffFamily._()
      : super(
          retry: null,
          name: r'listStaffProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListStaffProvider call([
    QueryPredicate<Model>? where,
  ]) =>
      ListStaffProvider._(argument: where, from: this);

  @override
  String toString() => r'listStaffProvider';
}

@ProviderFor(listAircraft)
final listAircraftProvider = ListAircraftFamily._();

final class ListAircraftProvider extends $FunctionalProvider<
        AsyncValue<List<Aircraft>>, List<Aircraft>, FutureOr<List<Aircraft>>>
    with $FutureModifier<List<Aircraft>>, $FutureProvider<List<Aircraft>> {
  ListAircraftProvider._(
      {required ListAircraftFamily super.from,
      required QueryPredicate<Model>? super.argument})
      : super(
          retry: null,
          name: r'listAircraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$listAircraftHash();

  @override
  String toString() {
    return r'listAircraftProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Aircraft>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Aircraft>> create(Ref ref) {
    final argument = this.argument as QueryPredicate<Model>?;
    return listAircraft(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListAircraftProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listAircraftHash() => r'af35941b421af3cdb46f39b5948e759f0d3e6ef1';

final class ListAircraftFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<Aircraft>>,
            QueryPredicate<Model>?> {
  ListAircraftFamily._()
      : super(
          retry: null,
          name: r'listAircraftProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListAircraftProvider call([
    QueryPredicate<Model>? where,
  ]) =>
      ListAircraftProvider._(argument: where, from: this);

  @override
  String toString() => r'listAircraftProvider';
}

@ProviderFor(listRoles)
final listRolesProvider = ListRolesFamily._();

final class ListRolesProvider extends $FunctionalProvider<
        AsyncValue<List<Role>>, List<Role>, FutureOr<List<Role>>>
    with $FutureModifier<List<Role>>, $FutureProvider<List<Role>> {
  ListRolesProvider._(
      {required ListRolesFamily super.from,
      required QueryPredicate<Model>? super.argument})
      : super(
          retry: null,
          name: r'listRolesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$listRolesHash();

  @override
  String toString() {
    return r'listRolesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Role>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Role>> create(Ref ref) {
    final argument = this.argument as QueryPredicate<Model>?;
    return listRoles(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListRolesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listRolesHash() => r'b741ef3e8389aa3b5a70b78a5d4bd98fc154d9ea';

final class ListRolesFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<Role>>,
            QueryPredicate<Model>?> {
  ListRolesFamily._()
      : super(
          retry: null,
          name: r'listRolesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListRolesProvider call([
    QueryPredicate<Model>? where,
  ]) =>
      ListRolesProvider._(argument: where, from: this);

  @override
  String toString() => r'listRolesProvider';
}

@ProviderFor(listCategories)
final listCategoriesProvider = ListCategoriesFamily._();

final class ListCategoriesProvider extends $FunctionalProvider<
        AsyncValue<List<Category>>, List<Category>, FutureOr<List<Category>>>
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  ListCategoriesProvider._(
      {required ListCategoriesFamily super.from,
      required QueryPredicate<Model>? super.argument})
      : super(
          retry: null,
          name: r'listCategoriesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$listCategoriesHash();

  @override
  String toString() {
    return r'listCategoriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    final argument = this.argument as QueryPredicate<Model>?;
    return listCategories(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListCategoriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listCategoriesHash() => r'004a813c9a0ffc8887f7a3077eb0c1fe2d50ba52';

final class ListCategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<Category>>,
            QueryPredicate<Model>?> {
  ListCategoriesFamily._()
      : super(
          retry: null,
          name: r'listCategoriesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListCategoriesProvider call([
    QueryPredicate<Model>? where,
  ]) =>
      ListCategoriesProvider._(argument: where, from: this);

  @override
  String toString() => r'listCategoriesProvider';
}

@ProviderFor(listSubcategories)
final listSubcategoriesProvider = ListSubcategoriesFamily._();

final class ListSubcategoriesProvider extends $FunctionalProvider<
        AsyncValue<List<Subcategory>>,
        List<Subcategory>,
        FutureOr<List<Subcategory>>>
    with
        $FutureModifier<List<Subcategory>>,
        $FutureProvider<List<Subcategory>> {
  ListSubcategoriesProvider._(
      {required ListSubcategoriesFamily super.from,
      required QueryPredicate<Model>? super.argument})
      : super(
          retry: null,
          name: r'listSubcategoriesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$listSubcategoriesHash();

  @override
  String toString() {
    return r'listSubcategoriesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Subcategory>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Subcategory>> create(Ref ref) {
    final argument = this.argument as QueryPredicate<Model>?;
    return listSubcategories(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListSubcategoriesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listSubcategoriesHash() => r'35b874e68d5a150141c7b98b61c930ef4f1cc77b';

final class ListSubcategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<Subcategory>>,
            QueryPredicate<Model>?> {
  ListSubcategoriesFamily._()
      : super(
          retry: null,
          name: r'listSubcategoriesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListSubcategoriesProvider call([
    QueryPredicate<Model>? where,
  ]) =>
      ListSubcategoriesProvider._(argument: where, from: this);

  @override
  String toString() => r'listSubcategoriesProvider';
}

@ProviderFor(listNoticeStaff)
final listNoticeStaffProvider = ListNoticeStaffFamily._();

final class ListNoticeStaffProvider extends $FunctionalProvider<
        AsyncValue<List<NoticeStaff>>,
        List<NoticeStaff>,
        FutureOr<List<NoticeStaff>>>
    with
        $FutureModifier<List<NoticeStaff>>,
        $FutureProvider<List<NoticeStaff>> {
  ListNoticeStaffProvider._(
      {required ListNoticeStaffFamily super.from,
      required QueryPredicate<Model>? super.argument})
      : super(
          retry: null,
          name: r'listNoticeStaffProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$listNoticeStaffHash();

  @override
  String toString() {
    return r'listNoticeStaffProvider'
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
    final argument = this.argument as QueryPredicate<Model>?;
    return listNoticeStaff(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListNoticeStaffProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listNoticeStaffHash() => r'a065c903b8e951bbfacb7b3b1a312d79d9028baa';

final class ListNoticeStaffFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<NoticeStaff>>,
            QueryPredicate<Model>?> {
  ListNoticeStaffFamily._()
      : super(
          retry: null,
          name: r'listNoticeStaffProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListNoticeStaffProvider call([
    QueryPredicate<Model>? where,
  ]) =>
      ListNoticeStaffProvider._(argument: where, from: this);

  @override
  String toString() => r'listNoticeStaffProvider';
}
