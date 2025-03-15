part of 'route.dart';

class ComplianceSentPage extends ConsumerWidget {
  const ComplianceSentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(reportFilterProvider);
    final dataAsync = ref.watch(reportsSentRepoProvider(filter));
    return ReportDataTable(value: dataAsync);
  }
}
