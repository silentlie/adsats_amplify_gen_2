import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/hazard_report/page.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/notice_to_crew/page.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/create/safety_notice/page.dart';
import 'package:adsats_amplify_gen_2/pages/main/sms/providers/notice.dart';
import 'package:adsats_amplify_gen_2/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:adsats_amplify_gen_2/helper/providers/selected_files.dart';

@Dependencies([SelectedFiles])
class ViewNoticePage extends ConsumerWidget {
  const ViewNoticePage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: Card(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: AsyncValueWidget(
                  value: ref.watch(noticeProvider(id)),
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
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: const Icon(Icons.cancel_outlined),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
