part of 'route.dart';

class CmsSentPage extends ConsumerWidget {
  const CmsSentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(reportFilterProvider);
    final dataAsync = ref.watch(reportsSentRepoProvider(filter));
    return ReportDataTable(value: dataAsync);
  }
}
