import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get.g.dart';

@Riverpod()
FutureOr<Notice> getNotice(
  Ref ref,
  ModelIdentifier<Notice> modelIdentifier,
) async {
  final request = ModelQueries.get<Notice>(Notice.classType, modelIdentifier);
  final response = await Amplify.API.query<Notice>(request: request).response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!;
}
