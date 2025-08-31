import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AmplifyAppSyncAPI {
  const AmplifyAppSyncAPI();

  Future<T?> getById<T extends Model>({
    required ModelType<T> modelType,
    required ModelIdentifier<T> modelIdentifier,
  }) async {
    final req = ModelQueries.get<T>(modelType, modelIdentifier);
    final res = await Amplify.API.query(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return res.data;
  }

  Future<List<T>> listAll<T extends Model>({
    required ModelType<T> modelType,
    QueryPredicate? where,
    int limit = 10000,
    void Function(void Function())? bindCancel,
  }) async {
    var req = ModelQueries.list<T>(modelType, where: where, limit: limit);
    final items = <T>[];
    while (true) {
      var op = Amplify.API.query(request: req);
      bindCancel?.call(op.cancel);
      final res = await op.response;
      if (res.errors.isNotEmpty) throw res.errors.first;
      items.addAll(res.data!.items.cast<T>());
      if (res.data?.hasNextResult ?? false) {
        req = res.data!.requestForNextResult!;
      } else {
        break;
      }
    }
    return items;
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

  Future<T> deleteById<T extends Model>({
    required ModelType<T> modelType,
    required ModelIdentifier<T> modelIdentifier,
  }) async {
    final req = ModelMutations.deleteById<T>(modelType, modelIdentifier);
    final res = await Amplify.API.mutate(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return res.data!;
  }

  Future<Map<String, dynamic>> query({
    required String document,
    Map<String, dynamic> variables = const {},
    void Function(void Function())? bindCancel,
  }) async {
    final req = GraphQLRequest<String>(
      document: document,
      variables: variables,
    );
    final op = Amplify.API.query(request: req);
    bindCancel?.call(op.cancel);
    final res = await op.response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return jsonDecode(res.data!) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> mutate({
    required String document,
    required Map<String, dynamic> variables,
  }) async {
    final req = GraphQLRequest<String>(
      document: document,
      variables: variables,
    );
    final res = await Amplify.API.mutate(request: req).response;
    if (res.errors.isNotEmpty) throw res.errors.first;
    return jsonDecode(res.data!) as Map<String, dynamic>;
  }
}
