import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AmplifyAppSyncAPI {
  const AmplifyAppSyncAPI();

  Future<T> getById<T extends Model>(
    ModelType<T> modelType,
    ModelIdentifier<T> modelIdentifier,
  ) async {
    final req = ModelQueries.get<T>(modelType, modelIdentifier);
    final res = await Amplify.API.query(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return res.data as T;
  }

  Future<List<T>> getAll<T extends Model>(
    ModelType<T> modelType,
    QueryPredicate? where,
  ) async {
    final req = ModelQueries.list<T>(modelType, where: where);
    final res = await Amplify.API.query(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return res.data!.items.cast<T>();
  }

  Future<T> create<T extends Model>(T model) async {
    final req = ModelMutations.create(model);
    final res = await Amplify.API.mutate(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return res.data!;
  }

  Future<T> update<T extends Model>(T model) async {
    final req = ModelMutations.update(model);
    final res = await Amplify.API.mutate(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return res.data!;
  }

  Future<T> delete<T extends Model>(T model) async {
    final req = ModelMutations.delete(model);
    final res = await Amplify.API.mutate(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return res.data!;
  }

  Future<T> deleteById<T extends Model>(
    ModelType<T> modelType,
    ModelIdentifier<T> modelIdentifier,
  ) async {
    final req = ModelMutations.deleteById<T>(modelType, modelIdentifier);
    final res = await Amplify.API.mutate(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return res.data!;
  }

  Future<Map<String, dynamic>> run(
      String documents, Map<String, dynamic> variables) async {
    final req = GraphQLRequest<String>(
      document: documents,
      variables: variables,
    );
    final res = await Amplify.API.query(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return jsonDecode(res.data!) as Map<String, dynamic>;
  }
}
