import 'dart:convert';

import 'package:adsats_amplify_gen_2/helper/extensions/enum_label_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/staff_name_extension.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/url_extension.dart';
import 'package:adsats_amplify_gen_2/helper/models/email_massage.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

extension EmailContentExtension on Notice {
  String get emailSubject {
    final typ = type?.label ?? 'NOTICE';
    final subj = subject;
    final stat = status?.label ?? 'UNKNOWN';
    return '$typ: $subj [$stat]';
  }

  /// The inner `<main>…</main>` block for email HTML.
  String get emailMainHtml {
    final esc = const HtmlEscape().convert;
    final badge = esc(type?.label ?? 'NOTICE');
    final issuer = esc(author?.fullName ?? 'Unknown');
    final subj = esc(subject);
    final status = esc(this.status?.label ?? 'UNKNOWN');
    final link = deepLink().toString();

    return '''
<main>
  <h2>Dear everyone,</h2>

  <div class="modern-quote">
    A new notice has been issued in the ADSATS system. Please review the details below:
  </div>

  <div class="notification-info">
    <span class="notification-badge">$badge</span>
    <p><strong>Issued By:</strong> $issuer</p>
    <p><strong>Subject:</strong> $subj</p>
    <p><strong>Status:</strong> $status</p>
  </div>

  <div class="modern-divider"></div>

  <p>Please review the notice by clicking the link below:</p>

  <a href="$link" target="_blank" class="action-link">View Notice</a>

  <p>If the above link doesn't work, copy and paste this URL into your browser:</p>
  <p>$link</p>

  <ul class="modern-list">
    <li>Review the notification details</li>
    <li>Click "Mark as read" to acknowledge receipt</li>
    <li>Take necessary actions as required</li>
  </ul>

  <div class="modern-divider"></div>

  <p>Best regards,<br><strong>ADSATS Team</strong></p>
</main>
''';
  }

  EmailMessage toEmailMessage() => EmailMessage(
        subject: emailSubject,
        htmlMain: emailMainHtml,
        sender: author?.fullName ?? 'Unknown',
      );
}

extension ReportEmailX on Report {
  String get emailSubject {
    final typ = type?.label ?? 'AUDIT';
    final subj = subject;
    final stat = status?.label ?? 'UNKNOWN';
    return '$typ: $subj [$stat]';
  }

  /// The inner `<main>…</main>` block for email HTML.
  String get emailMainHtml {
    final esc = const HtmlEscape().convert;
    final badge = esc(type?.label ?? 'AUDIT');
    final issuer = esc(auditor?.fullName ?? 'Unknown');
    final subj = esc(subject);
    final status = esc(this.status?.label ?? 'UNKNOWN');
    final link = deepLink().toString();
    return '''
<main>
  <h2>Dear everyone,</h2>

  <div class="modern-quote">
    A new audit has been completed in the ADSATS system. Please review the details below:
  </div>

  <div class="notification-info">
    <span class="notification-badge">$badge</span>
    <p><strong>Issued By:</strong> $issuer</p>
    <p><strong>Subject:</strong> $subj</p>
    <p><strong>Status:</strong> $status</p>
  </div>

  <div class="modern-divider"></div>

  <p>Please review the report by clicking the link below:</p>

  <a href="$link" class="action-link">View Report</a>

  <p>If the above link doesn't work, copy and paste this URL into your browser:</p>
  <p>$link</p>

  <ul class="modern-list">
    <li>Review the audit details</li>
    <li>Click "Mark as read" to acknowledge receipt</li>
    <li>Take necessary actions as required</li>
  </ul>

  <div class="modern-divider"></div>

  <p>Best regards,<br><strong>ADSATS Team</strong></p>
</main>
''';
  }

  EmailMessage toEmailMessage() => EmailMessage(
        subject: emailSubject,
        htmlMain: emailMainHtml,
        sender: auditor?.fullName ?? 'Unknown',
      );
}
