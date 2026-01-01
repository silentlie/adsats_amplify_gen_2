import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/widgets/navigate_icon_button.dart';
import 'package:flutter/material.dart';

export 'create/shell.dart';
export 'reports/shell.dart';
export 'report/page.dart';

class CmsPage extends StatelessWidget {
  const CmsPage({super.key});

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
                    icon: CmsAllRoute().icon.icon!,
                    name: CmsAllRoute().label,
                    onPressed: () => CmsAllRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: CmsInboxRoute().icon.icon!,
                    name: CmsInboxRoute().label,
                    onPressed: () => CmsInboxRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: CmsSentRoute().icon.icon!,
                    name: CmsSentRoute().label,
                    onPressed: () => CmsSentRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: InternalAuditReportRoute().icon.icon!,
                    name: InternalAuditReportRoute().label,
                    onPressed: () => InternalAuditReportRoute().go(context),
                  ),
                  NavigateIconButton(
                    icon: ExternalAuditReportRoute().icon.icon!,
                    name: ExternalAuditReportRoute().label,
                    onPressed: () => ExternalAuditReportRoute().go(context),
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
