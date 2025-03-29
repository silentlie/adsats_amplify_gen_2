part of 'route.dart';

class CmsInboxPage extends ConsumerWidget {
  const CmsInboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(reportFilterProvider);
    final dataAsync = ref.watch(reportsInboxRepoProvider(filter));
    return ReportDataTable(value: dataAsync);
  }
}
