part of 'route.dart';

class ViewReportPage extends ConsumerStatefulWidget {
  const ViewReportPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<ViewReportPage> createState() => _ViewReportPageState();
}

class _ViewReportPageState extends ConsumerState<ViewReportPage> {

  @override
  Widget build(BuildContext context) {
    return AsyncValueWidget(
      value: ref.watch(noticeRepoProvider(widget.id)),
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
