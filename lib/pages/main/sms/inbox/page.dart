part of 'route.dart';

class SmsInboxPage extends ConsumerWidget {
  const SmsInboxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(noticeFilterProvider);
    final dataAsync = ref.watch(noticesInboxRepoProvider(filter));
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: NoticeDataTable(value: dataAsync),
      ),
    );
  }
}
