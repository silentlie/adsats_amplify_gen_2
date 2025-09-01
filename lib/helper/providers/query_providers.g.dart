// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(listStaff)
const listStaffProvider = ListStaffFamily._();

final class ListStaffProvider extends $FunctionalProvider<
        AsyncValue<List<Staff>>, List<Staff>, FutureOr<List<Staff>>>
    with $FutureModifier<List<Staff>>, $FutureProvider<List<Staff>> {
  const ListStaffProvider._(
      {required ListStaffFamily super.from,
      required QueryPredicate? super.argument})
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
    final argument = this.argument as QueryPredicate?;
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

String _$listStaffHash() => r'6269ce3e05ac16293962bdc8302f8d5f2e8f6a9a';

final class ListStaffFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Staff>>, QueryPredicate?> {
  const ListStaffFamily._()
      : super(
          retry: null,
          name: r'listStaffProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  ListStaffProvider call([
    QueryPredicate? where,
  ]) =>
      ListStaffProvider._(argument: where, from: this);

  @override
  String toString() => r'listStaffProvider';
}

@ProviderFor(listAircraft)
const listAircraftProvider = ListAircraftFamily._();

final class ListAircraftProvider extends $FunctionalProvider<
        AsyncValue<List<Aircraft>>, List<Aircraft>, FutureOr<List<Aircraft>>>
    with $FutureModifier<List<Aircraft>>, $FutureProvider<List<Aircraft>> {
  const ListAircraftProvider._(
      {required ListAircraftFamily super.from,
      required QueryPredicate? super.argument})
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
    final argument = this.argument as QueryPredicate?;
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

String _$listAircraftHash() => r'e9e2a962b7c0b316834b5cb3c0e9b5e45cb56e7e';

final class ListAircraftFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Aircraft>>, QueryPredicate?> {
  const ListAircraftFamily._()
      : super(
          retry: null,
          name: r'listAircraftProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  ListAircraftProvider call([
    QueryPredicate? where,
  ]) =>
      ListAircraftProvider._(argument: where, from: this);

  @override
  String toString() => r'listAircraftProvider';
}

@ProviderFor(listRoles)
const listRolesProvider = ListRolesFamily._();

final class ListRolesProvider extends $FunctionalProvider<
        AsyncValue<List<Role>>, List<Role>, FutureOr<List<Role>>>
    with $FutureModifier<List<Role>>, $FutureProvider<List<Role>> {
  const ListRolesProvider._(
      {required ListRolesFamily super.from,
      required QueryPredicate? super.argument})
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
    final argument = this.argument as QueryPredicate?;
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

String _$listRolesHash() => r'61544f5ded5fbb6d8e0affac00c36b5909b969ac';

final class ListRolesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Role>>, QueryPredicate?> {
  const ListRolesFamily._()
      : super(
          retry: null,
          name: r'listRolesProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  ListRolesProvider call([
    QueryPredicate? where,
  ]) =>
      ListRolesProvider._(argument: where, from: this);

  @override
  String toString() => r'listRolesProvider';
}

@ProviderFor(listCategories)
const listCategoriesProvider = ListCategoriesFamily._();

final class ListCategoriesProvider extends $FunctionalProvider<
        AsyncValue<List<Category>>, List<Category>, FutureOr<List<Category>>>
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  const ListCategoriesProvider._(
      {required ListCategoriesFamily super.from,
      required QueryPredicate? super.argument})
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
    final argument = this.argument as QueryPredicate?;
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

String _$listCategoriesHash() => r'862168f45f6078ab26c10df0e495f3dc7c9a278a';

final class ListCategoriesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Category>>, QueryPredicate?> {
  const ListCategoriesFamily._()
      : super(
          retry: null,
          name: r'listCategoriesProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  ListCategoriesProvider call([
    QueryPredicate? where,
  ]) =>
      ListCategoriesProvider._(argument: where, from: this);

  @override
  String toString() => r'listCategoriesProvider';
}

@ProviderFor(listSubcategories)
const listSubcategoriesProvider = ListSubcategoriesFamily._();

final class ListSubcategoriesProvider extends $FunctionalProvider<
        AsyncValue<List<Subcategory>>,
        List<Subcategory>,
        FutureOr<List<Subcategory>>>
    with
        $FutureModifier<List<Subcategory>>,
        $FutureProvider<List<Subcategory>> {
  const ListSubcategoriesProvider._(
      {required ListSubcategoriesFamily super.from,
      required QueryPredicate? super.argument})
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
    final argument = this.argument as QueryPredicate?;
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

String _$listSubcategoriesHash() => r'47c1dcfeb0e4f0836010d5bacf2b9164c46d324b';

final class ListSubcategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<Subcategory>>,
            QueryPredicate?> {
  const ListSubcategoriesFamily._()
      : super(
          retry: null,
          name: r'listSubcategoriesProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  ListSubcategoriesProvider call([
    QueryPredicate? where,
  ]) =>
      ListSubcategoriesProvider._(argument: where, from: this);

  @override
  String toString() => r'listSubcategoriesProvider';
}

@ProviderFor(listNoticeStaff)
const listNoticeStaffProvider = ListNoticeStaffFamily._();

final class ListNoticeStaffProvider extends $FunctionalProvider<
        AsyncValue<List<NoticeStaff>>,
        List<NoticeStaff>,
        FutureOr<List<NoticeStaff>>>
    with
        $FutureModifier<List<NoticeStaff>>,
        $FutureProvider<List<NoticeStaff>> {
  const ListNoticeStaffProvider._(
      {required ListNoticeStaffFamily super.from,
      required QueryPredicate? super.argument})
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
    final argument = this.argument as QueryPredicate?;
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

String _$listNoticeStaffHash() => r'a02e5240c4f7bac5e556248d137a3be5e5747877';

final class ListNoticeStaffFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<NoticeStaff>>,
            QueryPredicate?> {
  const ListNoticeStaffFamily._()
      : super(
          retry: null,
          name: r'listNoticeStaffProvider',
          dependencies: const <ProviderOrFamily>[],
          $allTransitiveDependencies: const <ProviderOrFamily>[],
          isAutoDispose: true,
        );

  ListNoticeStaffProvider call([
    QueryPredicate? where,
  ]) =>
      ListNoticeStaffProvider._(argument: where, from: this);

  @override
  String toString() => r'listNoticeStaffProvider';
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
