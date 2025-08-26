import 'package:adsats_amplify_gen_2/router/routes/route.dart';
import 'package:adsats_amplify_gen_2/widgets/navigate_icon_button.dart';
import 'package:flutter/material.dart';

export 'notices/shell.dart';
export 'create/shell.dart';
export 'notice/page.dart';

class SMSPage extends StatelessWidget {
  const SMSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Quick navigation:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                children: [
                  NavigateIconButton(
                    icon: SmsInboxRoute().icon.icon!,
                    name: SmsInboxRoute().label,
                    onPressed: () => SmsInboxRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: SmsSentRoute().icon.icon!,
                    name: SmsSentRoute().label,
                    onPressed: () => SmsSentRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: NoticeToCrewRoute().icon.icon!,
                    name: NoticeToCrewRoute().label,
                    onPressed: () => NoticeToCrewRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: SafetyNoticeRoute().icon.icon!,
                    name: SafetyNoticeRoute().label,
                    onPressed: () => SafetyNoticeRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: HazardReportRoute().icon.icon!,
                    name: HazardReportRoute().label,
                    onPressed: () => HazardReportRoute().go(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
