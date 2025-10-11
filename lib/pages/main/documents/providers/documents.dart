import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/filter.dart';
import 'package:adsats_amplify_gen_2/pages/main/documents/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'documents.g.dart';

@riverpod
Future<List<Document>> documents(Ref ref, Subcategory subcategory) async {
  final filter = ref.watch(documentFilterProvider(subcategory));
  final service = ref.read(documentsServiceProvider);
  return await service.list(
    variables: {"filter": filter.toJson()},
  );
}
