part of 'route.dart';

class NoticeToCrewPage extends StatelessWidget {
  const NoticeToCrewPage({
    super.key,
    this.notice,
  });
  final Notice? notice;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [noticeNotifierProvider],
      child: Consumer(
        builder: (context, ref, child) {
          final notifier = ref.read(noticeNotifierProvider.notifier);
          notifier.setNotice(
            notice ??
                Notice(
                  subject: "",
                  archived: false,
                  details: "{}",
                  type: NoticeType.Notice_to_Crew,
                  status: NoticeStatus.Draft,
                  aircraft: [],
                  documents: [],
                  recipients: [],
                ),
            notice != null,
          );
          return Center(
            child: Form(
              key: ref.watch(
                noticeNotifierProvider.select(
                  (value) => value.formKey,
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1536.0),
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                            'Notice to Crew',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        NoticeBasicDetailsWidget(),
                        NoticeToCrewBody(),
                        const Divider(),
                        NoticeRecipientsWidget(),
                        const Divider(),
                        NoticeDocumentsWidget(),
                        const Divider(),
                        ActionsRowWidget()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NoticeToCrewBody extends ConsumerWidget {
  const NoticeToCrewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(noticeNotifierProvider.select(
      (value) => value.details,
    ));
    final notifier = ref.read(noticeNotifierProvider.notifier);
    return GlobalTextFormField(
      labelText: "Message",
      onSaved: (value) {
        details["message"] = value!;
        notifier.updateNotice(details: details);
      },
      initialValue: details["message"],
      enabled: ref.watch(
        noticeNotifierProvider.select(
          (value) => value.editMode,
        ),
      ),
      minLines: 5,
    );
  }
}
