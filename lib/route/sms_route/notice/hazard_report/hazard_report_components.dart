part of 'hazard_report_widget.dart';

class MitigateCommentWidget extends StatefulWidget {
  const MitigateCommentWidget({super.key});

  @override
  State<MitigateCommentWidget> createState() => _MitigateCommentWidgetState();
}

class _MitigateCommentWidgetState extends State<MitigateCommentWidget> {
  @override
  Widget build(BuildContext context) {
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    noticeNotifier.details.putIfAbsent(
      "included_comment",
      () => false,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                'Include mitigation comment?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Radio(
                value: true,
                groupValue: noticeNotifier.details['included_comment'],
                onChanged: (value) {
                  if (noticeNotifier.editMode) {
                    setState(() {
                      noticeNotifier.details['included_comment'] = value!;
                    });
                  }
                },
              ),
              const Text(
                'Yes',
              ),
              Radio(
                value: false,
                groupValue: noticeNotifier.details['included_comment'],
                onChanged: (value) {
                  if (noticeNotifier.editMode) {
                    setState(() {
                      noticeNotifier.details['included_comment'] = value!;
                    });
                  }
                },
              ),
              const Text(
                'No',
              ),
            ],
          ),
        ),
        if (noticeNotifier.details['included_comment'] == true)
          GlobalTextFormField(
            labelText:
                'In your opinion, how could the hazard or event be mitigated?',
            onSaved: (value) {
              noticeNotifier.details["mitigation"] = value;
            },
            initialValue: noticeNotifier.details["mitigation"],
            enabled: true,
            minLines: 3,
          ),
      ],
    );
  }
}

class SafetyOfficersSection extends StatelessWidget {
  const SafetyOfficersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    if (noticeNotifier.status == NoticeStatus.Draft ||
        noticeNotifier.status == NoticeStatus.Open) return SizedBox();
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'This section to be completed by the safety officers',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class LikelihoodWidget extends StatefulWidget {
  const LikelihoodWidget({super.key});

  @override
  State<LikelihoodWidget> createState() => _LikelihoodWidgetState();
}

class _LikelihoodWidgetState extends State<LikelihoodWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ConsequenceWidget extends StatefulWidget {
  const ConsequenceWidget({super.key});

  @override
  State<ConsequenceWidget> createState() => _ConsequenceWidgetState();
}

class _ConsequenceWidgetState extends State<ConsequenceWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
