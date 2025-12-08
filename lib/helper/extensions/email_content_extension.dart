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

  /// The inner HTML block for email, designed to be Outlook-safe.
  String get emailMainHtml {
    final esc = const HtmlEscape().convert;
    final badge = esc(type?.label ?? 'NOTICE');
    final issuer = esc(author?.fullName ?? 'Unknown');
    final subj = esc(subject);
    final status = esc(this.status?.label ?? 'UNKNOWN');
    final link = esc(deepLink().toString());

    return '''
<!-- START MAIN CONTENT -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="font-family:Arial, sans-serif; font-size:14px; line-height:1.5; color:#333333;">

      <h2 style="font-size:18px; color:#0056b3; margin:0 0 10px 0;">
        Dear everyone,
      </h2>

      <p style="margin:10px 0; line-height:1.5;">
        A new notice has been issued in the ADSATS system. Please review the details below:
      </p>

      <!-- Notice info box -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#deebf7; border:1px solid #b3d7ff; border-left:4px solid #0056b3; margin:15px 0;">
        <tr>
          <td style="padding:10px 15px;">

            <!-- Badge -->
            <div style="display:inline-block; padding:4px 10px; background-color:#0056b3; color:#ffffff;
                        font-size:12px; font-weight:bold; margin-bottom:8px;">
              $badge
            </div>

            <p style="margin:6px 0;">
              <strong style="color:#0056b3;">Issued By:</strong>
              <span style="color:#333333;"> $issuer</span>
            </p>
            <p style="margin:6px 0;">
              <strong style="color:#0056b3;">Subject:</strong>
              <span style="color:#333333;"> $subj</span>
            </p>
            <p style="margin:6px 0;">
              <strong style="color:#0056b3;">Status:</strong>
              <span style="color:#333333;"> $status</span>
            </p>

          </td>
        </tr>
      </table>

      <!-- Divider -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0;">
        <tr>
          <td style="height:1px; background-color:#b3d7ff; font-size:0; line-height:0;">&nbsp;</td>
        </tr>
      </table>

      <p style="margin:10px 0;">
        Please review the notice by clicking the link below:
      </p>

      <!-- Button as table (bulletproof) -->
      <table border="0" cellspacing="0" cellpadding="0" style="margin:10px 0 15px 0;">
        <tr>
          <td align="center"
              style="background-color:#0056b3; padding:10px 18px; border-radius:3px;">
            <a href="$link"
            style="
              color:#ffffff;
              text-decoration:none;
              font-weight:bold;
              font-size:14px;
              font-family:Arial, sans-serif;
              display:inline-block;
            ">
              Log onto ADSATS here to view notice
            </a>
          </td>
        </tr>
      </table>

      <p style="margin:10px 0;">
        If the above link doesn't work, copy and paste this URL into your browser:
      </p>

      <p style="margin:8px 0; word-break:break-all;">
        <a href="$link" style="color:#0056b3; text-decoration:underline;">$link</a>
      </p>

      <!-- Simple list -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0;">
        <tr>
          <td style="padding:0;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="padding:8px 12px; background-color:#deebf7; border-left:3px solid #0056b3; font-size:14px;">
                  Review the notification details
                </td>
              </tr>
              <tr>
                <td style="padding:8px 12px; background-color:#deebf7; border-left:3px solid #0056b3; font-size:14px; border-top:1px solid #ffffff;">
                  Click "Mark as read" to acknowledge receipt
                </td>
              </tr>
              <tr>
                <td style="padding:8px 12px; background-color:#deebf7; border-left:3px solid #0056b3; font-size:14px; border-top:1px solid #ffffff;">
                  Take necessary actions as required
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <!-- Divider -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0;">
        <tr>
          <td style="height:1px; background-color:#b3d7ff; font-size:0; line-height:0;">&nbsp;</td>
        </tr>
      </table>

      <p style="margin:10px 0;">
        Best regards,<br>
        <strong>ADSATS Team</strong>
      </p>

    </td>
  </tr>
</table>
<!-- END MAIN CONTENT -->
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

  /// Outlook-safe inner HTML block for report emails.
  String get emailMainHtml {
    final esc = const HtmlEscape().convert;
    final badge = esc(type?.label ?? 'AUDIT');
    final issuer = esc(auditor?.fullName ?? 'Unknown');
    final subj = esc(subject);
    final status = esc(this.status?.label ?? 'UNKNOWN');
    final link = esc(deepLink().toString());

    return '''
<!-- START MAIN CONTENT -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="font-family:Arial, sans-serif; font-size:14px; line-height:1.5; color:#333333;">

      <h2 style="font-size:18px; color:#0056b3; margin:0 0 10px 0;">
        Dear everyone,
      </h2>

      <p style="margin:10px 0; line-height:1.5;">
        A new audit report has been completed in the ADSATS system. Please review the details below:
      </p>

      <!-- Info box -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0"
             style="background-color:#deebf7; border:1px solid #b3d7ff; border-left:4px solid #0056b3; margin:15px 0;">
        <tr>
          <td style="padding:10px 15px;">

            <!-- Badge -->
            <div style="display:inline-block; padding:4px 10px; background-color:#0056b3; color:#ffffff;
                        font-size:12px; font-weight:bold; margin-bottom:8px;">
              $badge
            </div>

            <p style="margin:6px 0;">
              <strong style="color:#0056b3;">Audited By:</strong>
              <span style="color:#333333;"> $issuer</span>
            </p>
            <p style="margin:6px 0;">
              <strong style="color:#0056b3;">Subject:</strong>
              <span style="color:#333333;"> $subj</span>
            </p>
            <p style="margin:6px 0;">
              <strong style="color:#0056b3;">Status:</strong>
              <span style="color:#333333;"> $status</span>
            </p>

          </td>
        </tr>
      </table>

      <!-- Divider -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0;">
        <tr>
          <td style="height:1px; background-color:#b3d7ff; font-size:0; line-height:0;">&nbsp;</td>
        </tr>
      </table>

      <p style="margin:10px 0;">
        Please review the audit report by clicking the link below:
      </p>

      <!-- Bulletproof button -->
      <table border="0" cellspacing="0" cellpadding="0" style="margin:10px 0 15px 0;">
        <tr>
          <td align="center"
              style="background-color:#0056b3; padding:10px 18px; border-radius:3px;">
            <a href="$link"
            style="
              color:#ffffff;
              text-decoration:none;
              font-weight:bold;
              font-size:14px;
              font-family:Arial, sans-serif;
              display:inline-block;
            ">
              Log onto ADSATS here to view report
            </a>
          </td>
        </tr>
      </table>

      <p style="margin:10px 0;">
        If the above link doesn't work, copy and paste this URL into your browser:
      </p>

      <p style="margin:8px 0; word-break:break-all;">
        <a href="$link" style="color:#0056b3; text-decoration:underline;">$link</a>
      </p>

      <!-- Simple list -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0;">
        <tr>
          <td style="padding:0;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td style="padding:8px 12px; background-color:#deebf7; border-left:3px solid #0056b3; font-size:14px;">
                  Review the audit findings
                </td>
              </tr>
              <tr>
                <td style="padding:8px 12px; background-color:#deebf7; border-left:3px solid #0056b3; font-size:14px; border-top:1px solid #ffffff;">
                  Click "Mark as read" after reviewing the document
                </td>
              </tr>
              <tr>
                <td style="padding:8px 12px; background-color:#deebf7; border-left:3px solid #0056b3; font-size:14px; border-top:1px solid #ffffff;">
                  Complete any required follow-up actions
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>

      <!-- Divider -->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0;">
        <tr>
          <td style="height:1px; background-color:#b3d7ff; font-size:0; line-height:0;">&nbsp;</td>
        </tr>
      </table>

      <p style="margin:10px 0;">
        Best regards,<br>
        <strong>ADSATS Team</strong>
      </p>

    </td>
  </tr>
</table>
<!-- END MAIN CONTENT -->
''';
  }

  EmailMessage toEmailMessage() => EmailMessage(
        subject: emailSubject,
        htmlMain: emailMainHtml,
        sender: auditor?.fullName ?? 'Unknown',
      );
}
