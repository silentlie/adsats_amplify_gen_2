part of 'route.dart';

class SmsSentPage extends ConsumerWidget {
  const SmsSentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(noticeFilterProvider);
    final dataAsync = ref.watch(noticesSentRepoProvider(filter));
    return DataTableWidget(value: dataAsync);
  }
}
