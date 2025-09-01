import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart' hide Category;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_providers.g.dart';

//TODO: transform to databaseAPIProvider then delete
@Riverpod(dependencies: [])
FutureOr<List<Staff>> listStaff(
  Ref ref, [
  QueryPredicate? where,
]) async {
  final request = ModelQueries.list<Staff>(
    Staff.classType,
    where: where,
  );
  final response = await Amplify.API
      .query<PaginatedResult<Staff>>(
        request: request,
      )
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!.items.cast<Staff>();
}

@Riverpod(dependencies: [])
FutureOr<List<Aircraft>> listAircraft(
  Ref ref, [
  QueryPredicate? where,
]) async {
  final request = ModelQueries.list<Aircraft>(
    Aircraft.classType,
    where: where,
  );
  final response = await Amplify.API
      .query<PaginatedResult<Aircraft>>(
        request: request,
      )
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!.items.cast<Aircraft>();
}

@Riverpod(dependencies: [])
FutureOr<List<Role>> listRoles(
  Ref ref, [
  QueryPredicate? where,
]) async {
  final request = ModelQueries.list<Role>(
    Role.classType,
    where: where,
  );
  final response = await Amplify.API
      .query<PaginatedResult<Role>>(
        request: request,
      )
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!.items.cast<Role>();
}

@Riverpod(dependencies: [])
FutureOr<List<Category>> listCategories(
  Ref ref, [
  QueryPredicate? where,
]) async {
  final request = ModelQueries.list<Category>(
    Category.classType,
    where: where,
  );
  final response = await Amplify.API
      .query<PaginatedResult<Category>>(
        request: request,
      )
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!.items.cast<Category>();
}

@Riverpod(dependencies: [])
FutureOr<List<Subcategory>> listSubcategories(
  Ref ref, [
  QueryPredicate? where,
]) async {
  final request = ModelQueries.list<Subcategory>(
    Subcategory.classType,
    where: where,
  );
  final response = await Amplify.API
      .query<PaginatedResult<Subcategory>>(
        request: request,
      )
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!.items.cast<Subcategory>();
}

@Riverpod(dependencies: [])
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
