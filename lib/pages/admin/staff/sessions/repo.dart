import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repo.g.dart';

@Riverpod()
FutureOr<List<Session>> sessionsRepo(
  Ref ref,
  Staff staff,
) async {
  final request = ModelQueries.list<Session>(
    Session.classType,
    where: Session.STAFF.eq(staff.id),
  );
  final response = await Amplify.API
      .query<PaginatedResult<Session>>(
        request: request,
      )
      .response;
  if (response.errors.isNotEmpty) {
    throw response.errors.first;
  }
  return response.data!.items.cast<Session>();
}
