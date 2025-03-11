part of 'route.dart';

class ViewReportPage extends ConsumerWidget {
  const ViewReportPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(noticeRepoProvider(id)),
      data: (value) {
        ref.watch(noticeNotifierProvider.notifier).setNotice(value, true);
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
