part of 'route.dart';

class HazardReportPage extends StatelessWidget {
  const HazardReportPage({
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
                  type: NoticeType.Hazard_report,
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
                        const Divider(),
                        HazardReportBody(),
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

class HazardReportBody extends ConsumerWidget {
  const HazardReportBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(noticeNotifierProvider.notifier);
    final isEditMode = ref.watch(
      noticeNotifierProvider.select(
        (value) => value.editMode,
      ),
    );
    final details = ref.read(noticeNotifierProvider.select(
      (value) => value.details,
    ));
    details.putIfAbsent(
      "isConfidential",
      () => false,
    );

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GlobalTextFormField(
                labelText: "Location",
                onSaved: (value) {
                  details["location"] = value;
                  notifier.updateNotice(details: details);
                },
                initialValue: details["location"],
                enabled: isEditMode,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: false, label: "Open"),
                    DropdownMenuEntry(value: true, label: "Confidential"),
                  ],
                  enabled: isEditMode,
                  onSelected: (value) {
                    details["isConfidential"] = value!;
                    notifier.updateNotice(details: details);
                  },
                  hintText: "Is this report confidential?",
                  expandedInsets: EdgeInsets.zero,
                  initialSelection: details["isConfidential"],
                ),
              ),
            ),
          ],
        ),
        GlobalTextFormField(
          labelText: "Describe the Hazard or the Event",
          onSaved: (value) {
            details["description"] = value;
            notifier.updateNotice(details: details);
          },
          initialValue: details["description"],
          enabled: isEditMode,
          minLines: 5,
        ),
        MitigateCommentWidget(),
        RiskWidget(),
        SafetyOfficersSection(),
      ],
    );
  }
}
