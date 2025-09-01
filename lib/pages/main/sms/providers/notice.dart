import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notice.g.dart';

@Riverpod()
Future<Notice> notice(Ref ref, String id) async {
  final service = ref.read(noticeServiceProvider);
  return await service.getById(id);
}
