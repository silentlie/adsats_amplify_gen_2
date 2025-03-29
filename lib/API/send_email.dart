import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/helper/format_staff_name.dart';
import 'package:adsats_amplify_gen_2/helper/format_type_name.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final domainName = "${Uri.base.host}${Uri.base.hasPort ? ":${Uri.base.port}" : ""}";

Future<void> sendEmail({
  required String subject,
  required String sender,
  required String htmlMain,
  required List<String> recipients,
}) async {
  try {
    final request = GraphQLRequest<String>(
      document: sendEmailDocument,
      variables: {
        "subject": subject,
        "recipients": recipients,
        "htmlBody": buildEmailHTML(htmlMain),
        "author": sender,
      },
    );
    final response = await Amplify.API.query(request: request).response;
    if (response.errors.isNotEmpty) {
      throw response.errors.first;
    }
    // Map<String, dynamic> jsonMap = json.decode(response.data!);
  } on ApiException catch (e) {
    debugPrint('send email failed: $e');
  }
}

String buildEmailHTML(String main) {
  final now = DateTime.now();
  final formattedDate = DateFormat('EEEE, d MMMM, yyyy').format(now);
  final formattedTime = DateFormat('h:mm a').format(now);
  final timezoneName = now.timeZoneName;
  return '''
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>ADSATS Notification</title>
        $styles
      </head>
      <body>
        <div class="container">
          <header>
            <h1>ADSATS - Aviation Document Storage and Tracking System</h1>
          </header>

          <div class="timestamp">
            <span class="datetime">$formattedDate at $formattedTime</span>
            <br>
            (<span class="timezone-label">Timezone: $timezoneName</span>)
          </div>
          $main
          <footer>
            <p>This is an automated message, please do not reply.</p>
          </footer>
        </div>
      </body>
    </html>
  ''';
}

String buildNoticeEmailMain(Notice notice) {
  return '''
<main>
  <h2>Dear everyone,</h2>

  <div class="modern-quote">
    A new notice has been issued in the ADSATS system. Please review the details below:
  </div>

  <div class="notification-info">
    <span class="notification-badge">${formatEnum(notice.type!.name)}</span>
    <p><strong>Issued By:</strong> ${formatStaffName(notice.author!)}</p>
    <p><strong>Subject:</strong> ${notice.subject}</p>
    <p><strong>Status:</strong> ${formatEnum(notice.status!.name)}</p>
  </div>

  <div class="modern-divider"></div>

  <p>Please review the notice by clicking the link below:</p>

  <a href="${generateNoticeLink(notice)}" class="action-link">
    View Notice
  </a>

  <ul class="modern-list">
    <li>Review the notification details</li>
    <li>Click "Mark as read" to acknowledge receipt</li>
    <li>Take necessary actions as required</li>
  </ul>

  <div class="modern-divider"></div>

  <p>
    Best regards,<br>
    <strong>ADSATS Team</strong>
  </p>
</main>
''';
}

String generateNoticeLink(Notice notice) {
  return '$domainName/sms/${notice.id}';
}

String buildReportEmailMain(Report report) {
  return '''
<main>
  <h2>Dear everyone,</h2>

  <div class="modern-quote">
    A new audit has been completed in the ADSATS system. Please review the details below:
  </div>

  <div class="notification-info">
    <span class="notification-badge">${formatEnum(report.type!.name)}</span>
    <p><strong>Issued By:</strong> ${formatStaffName(report.auditor!)}</p>
    <p><strong>Subject:</strong> ${report.subject}</p>
    <p><strong>Status:</strong> ${formatEnum(report.status!.name)}</p>
  </div>

  <div class="modern-divider"></div>

  <p>Please review the report by clicking the link below:</p>

  <a href="${generateReportLink(report)}" class="action-link">
    View Report
  </a>

  <ul class="modern-list">
    <li>Review the audit details</li>
    <li>Click "Mark as read" to acknowledge receipt</li>
    <li>Take necessary actions as required</li>
  </ul>

  <div class="modern-divider"></div>

  <p>
    Best regards,<br>
    <strong>ADSATS Team</strong>
  </p>
</main>
''';
}

String generateReportLink(Report report) {
  return '$domainName/cms/${report.id}';
}

const styles = '''
  <style type="text/css">
    /* Reset styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* Base styles */
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      background-color: #f0f0f0;
      color: #333333 !important;
    }

    /* Container */
    .container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      background-color: #ffffff !important;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    /* Header */
    header {
      background-color: #0056b3 !important;
      padding: 20px;
      border-radius: 6px 6px 0 0;
      margin: -20px -20px 20px -20px;
    }

    header h1 {
      font-size: 24px;
      font-weight: 600;
      text-align: center;
      color: #ffffff !important;
    }

    /* Timestamp */
    .timestamp {
      text-align: right;
      font-size: 14px;
      color: #333333 !important;
      margin-bottom: 20px;
      padding: 10px;
      background-color: #cce0f5 !important;
      border-radius: 4px;
    }

    /* Notice info box */
    .notification-info {
      background-color: #deebf7 !important;
      border: 1px solid #b3d7ff !important;
      border-left: 4px solid #0056b3 !important;
      border-radius: 4px;
      padding: 15px;
      margin: 15px 0;
    }

    .notification-info p {
      margin: 8px 0;
      color: #333333 !important;
    }

    .notification-info strong {
      color: #0056b3 !important;
      font-weight: bold;
    }

    /* Action link */
    .action-link {
      display: inline-block;
      width: auto;
      max-width: 100%;
      background-color: #0056b3 !important;
      color: #ffffff !important;
      padding: 12px 24px;
      text-decoration: none;
      border-radius: 4px;
      margin: 15px 0;
      font-weight: bold;
      text-align: center;
    }

    /* Modern list */
    .modern-list {
      list-style: none;
      padding: 0;
      margin: 15px 0;
    }

    .modern-list li {
      padding: 10px 15px;
      margin: 8px 0;
      background-color: #deebf7 !important;
      border-left: 3px solid #0056b3 !important;
      color: #333333 !important;
    }

    /* Typography */
    h2 {
      color: #0056b3 !important;
      margin-bottom: 15px;
      font-size: 20px;
    }

    p {
      margin: 10px 0;
      color: #333333 !important;
    }

    /* Notice badge */
    .notification-badge {
      display: inline-block;
      padding: 6px 12px;
      background-color: #0056b3 !important;
      color: #ffffff !important;
      border-radius: 20px;
      font-size: 14px;
      font-weight: 600;
      margin: 4px 0;
    }

    /* Divider */
    .modern-divider {
      height: 1px;
      background-color: #b3d7ff !important;
      margin: 20px 0;
    }

    /* Footer */
    footer {
      margin-top: 30px;
      padding-top: 20px;
      border-top: 1px solid #b3d7ff;
      text-align: center;
      font-size: 14px;
      color: #666666 !important;
    }

    /* Responsive adjustments */
    @media screen and (max-width: 600px) {
      .container {
        width: 100%;
        padding: 15px;
      }

      header h1 {
        font-size: 20px;
      }

      .action-link {
        display: block;
        width: 100%;
        padding: 12px 16px;
        box-sizing: border-box;
      }

      .notification-info {
        padding: 12px;
      }
    }
  </style>
''';
