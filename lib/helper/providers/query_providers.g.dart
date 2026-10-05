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
      required ({
        QueryPredicate<Model>? where,
        bool includeArchived,
      })
          super.argument})
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Staff>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Staff>> create(Ref ref) {
    final argument = this.argument as ({
      QueryPredicate<Model>? where,
      bool includeArchived,
    });
    return listStaff(
      ref,
      where: argument.where,
      includeArchived: argument.includeArchived,
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

String _$listStaffHash() => r'c5442c910950367000345bb52ea75913c77c3573';

final class ListStaffFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Staff>>,
            ({
              QueryPredicate<Model>? where,
              bool includeArchived,
            })> {
  ListStaffFamily._()
      : super(
          retry: null,
          name: r'listStaffProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListStaffProvider call({
    QueryPredicate<Model>? where,
    bool includeArchived = false,
  }) =>
      ListStaffProvider._(argument: (
        where: where,
        includeArchived: includeArchived,
      ), from: this);

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
      required ({
        QueryPredicate<Model>? where,
        bool includeArchived,
      })
          super.argument})
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Aircraft>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Aircraft>> create(Ref ref) {
    final argument = this.argument as ({
      QueryPredicate<Model>? where,
      bool includeArchived,
    });
    return listAircraft(
      ref,
      where: argument.where,
      includeArchived: argument.includeArchived,
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

String _$listAircraftHash() => r'3640913f485c46d636cd84819751a608dc539c3a';

final class ListAircraftFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Aircraft>>,
            ({
              QueryPredicate<Model>? where,
              bool includeArchived,
            })> {
  ListAircraftFamily._()
      : super(
          retry: null,
          name: r'listAircraftProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListAircraftProvider call({
    QueryPredicate<Model>? where,
    bool includeArchived = false,
  }) =>
      ListAircraftProvider._(argument: (
        where: where,
        includeArchived: includeArchived,
      ), from: this);

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
      required ({
        QueryPredicate<Model>? where,
        bool includeArchived,
      })
          super.argument})
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Role>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Role>> create(Ref ref) {
    final argument = this.argument as ({
      QueryPredicate<Model>? where,
      bool includeArchived,
    });
    return listRoles(
      ref,
      where: argument.where,
      includeArchived: argument.includeArchived,
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

String _$listRolesHash() => r'f45723d5bf12eaa3da702cde97a836a48fae7d79';

final class ListRolesFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Role>>,
            ({
              QueryPredicate<Model>? where,
              bool includeArchived,
            })> {
  ListRolesFamily._()
      : super(
          retry: null,
          name: r'listRolesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListRolesProvider call({
    QueryPredicate<Model>? where,
    bool includeArchived = false,
  }) =>
      ListRolesProvider._(argument: (
        where: where,
        includeArchived: includeArchived,
      ), from: this);

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
      required ({
        QueryPredicate<Model>? where,
        bool includeArchived,
      })
          super.argument})
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    final argument = this.argument as ({
      QueryPredicate<Model>? where,
      bool includeArchived,
    });
    return listCategories(
      ref,
      where: argument.where,
      includeArchived: argument.includeArchived,
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

String _$listCategoriesHash() => r'0de1684c0acdace9488b0b8908d807afd314dea1';

final class ListCategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Category>>,
            ({
              QueryPredicate<Model>? where,
              bool includeArchived,
            })> {
  ListCategoriesFamily._()
      : super(
          retry: null,
          name: r'listCategoriesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListCategoriesProvider call({
    QueryPredicate<Model>? where,
    bool includeArchived = false,
  }) =>
      ListCategoriesProvider._(argument: (
        where: where,
        includeArchived: includeArchived,
      ), from: this);

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
      required ({
        QueryPredicate<Model>? where,
        bool includeArchived,
      })
          super.argument})
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
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Subcategory>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Subcategory>> create(Ref ref) {
    final argument = this.argument as ({
      QueryPredicate<Model>? where,
      bool includeArchived,
    });
    return listSubcategories(
      ref,
      where: argument.where,
      includeArchived: argument.includeArchived,
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

String _$listSubcategoriesHash() => r'91304c6c6c1e1e88f3d7dd6b757c22abf3a859fb';

final class ListSubcategoriesFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Subcategory>>,
            ({
              QueryPredicate<Model>? where,
              bool includeArchived,
            })> {
  ListSubcategoriesFamily._()
      : super(
          retry: null,
          name: r'listSubcategoriesProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ListSubcategoriesProvider call({
    QueryPredicate<Model>? where,
    bool includeArchived = false,
  }) =>
      ListSubcategoriesProvider._(argument: (
        where: where,
        includeArchived: includeArchived,
      ), from: this);

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
