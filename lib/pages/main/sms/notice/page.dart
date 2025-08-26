import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/hazard_report/page.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/notice_to_crew/page.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/safety_notice/page.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/notice/repo.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewNoticePage extends ConsumerWidget {
  const ViewNoticePage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(noticeRepoProvider(id)),
      data: (value) {
        return switch (value.type) {
          NoticeType.Notice_to_Crew => NoticeToCrewPage(
              notice: value,
            ),
          NoticeType.Safety_notice => SafetyNoticePage(
              notice: value,
            ),
          NoticeType.Hazard_report => HazardReportPage(
              notice: value,
            ),
          _ => Center(
              child: Text("Unknown notice type"),
            ),
        };
      },
    );
  }
}
