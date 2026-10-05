import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/helper/providers/database_api.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_providers.g.dart';

QueryPredicate? _selectionWhere(
  QueryPredicate? where,
  QueryPredicate active,
  bool includeArchived,
) {
  if (includeArchived) return where;
  return where == null
      ? active
      : QueryPredicateGroup(QueryPredicateGroupType.and, [where, active]);
}

@riverpod
Future<List<Staff>> listStaff(
  Ref ref, {
  QueryPredicate? where,
  bool includeArchived = false,
}) {
  return ref.watch(databaseAPIProvider).listAll(
        modelType: Staff.classType,
        where:
            _selectionWhere(where, Staff.ARCHIVED.eq(false), includeArchived),
      );
}

@riverpod
Future<List<Aircraft>> listAircraft(
  Ref ref, {
  QueryPredicate? where,
  bool includeArchived = false,
}) {
  return ref.watch(databaseAPIProvider).listAll(
        modelType: Aircraft.classType,
        where: _selectionWhere(
            where, Aircraft.ARCHIVED.eq(false), includeArchived),
      );
}

@riverpod
Future<List<Role>> listRoles(
  Ref ref, {
  QueryPredicate? where,
  bool includeArchived = false,
}) {
  return ref.watch(databaseAPIProvider).listAll(
        modelType: Role.classType,
        where: _selectionWhere(where, Role.ARCHIVED.eq(false), includeArchived),
      );
}

@riverpod
Future<List<Category>> listCategories(
  Ref ref, {
  QueryPredicate? where,
  bool includeArchived = false,
}) {
  return ref.watch(databaseAPIProvider).listAll(
        modelType: Category.classType,
        where: _selectionWhere(
            where, Category.ARCHIVED.eq(false), includeArchived),
      );
}

@riverpod
Future<List<Subcategory>> listSubcategories(
  Ref ref, {
  QueryPredicate? where,
  bool includeArchived = false,
}) {
  return ref.watch(databaseAPIProvider).listAll(
        modelType: Subcategory.classType,
        where: _selectionWhere(
            where, Subcategory.ARCHIVED.eq(false), includeArchived),
      );
}

@riverpod
FutureOr<List<NoticeStaff>> listNoticeStaff(
  Ref ref, [
  QueryPredicate? where,
]) async {
  final request = ModelQueries.list<NoticeStaff>(
    NoticeStaff.classType,
    where: where,
  );
  final response = await Amplify.API
      .query<PaginatedResult<NoticeStaff>>(
        request: request,
      )
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!.items.cast<NoticeStaff>();
}
