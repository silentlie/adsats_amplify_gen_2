import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/helper/format_staff_name.dart';
import 'package:adsats_amplify_gen_2/helper/format_type_name.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> sendEmail({
  required String subject,
  required String author,
  required String htmlBody,
  required List<String> recipients,
}) async {
  try {
    final request = GraphQLRequest<String>(
      document: sendEmailDocument,
      variables: {
        "subject": subject,
        "recipients": recipients,
        "htmlBody": htmlBody,
        "author": author,
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

String buildNoticeEmailHTMLbody(Notice notice) {
  final now = DateTime.now();
  final dateFormatter =
      DateFormat('EEEE, d MMMM, yyyy');
  final timeFormatter = DateFormat('h:mm a');
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
        min-width: 100%;
        font-family: Arial, sans-serif;
        line-height: 1.6;
        background-color: #f4f4f4;
        color: #333333;
      }

      /* Container wrapper */
      .container {
        max-width: 600px;
        margin: 20px auto;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }

      /* Header styles */
      header {
        background-color: #1e88e5;
        padding: 30px 20px;
        text-align: center;
        border-radius: 8px 8px 0 0;
      }

      header h1 {
        color: white;
        margin: 0;
        font-size: 28px;
        font-weight: 600;
      }

      /* Timestamp styles */
      .timestamp {
        background-color: #f8f9fa;
        padding: 10px 20px;
        border-bottom: 1px solid #e9ecef;
        color: #666666;
        font-size: 14px;
      }

      /* Main content styles */
      main {
        padding: 30px 20px;
        background-color: #ffffff;
      }

      main h2 {
        color: #2c3e50;
        margin-bottom: 20px;
      }

      main p {
        margin-bottom: 15px;
      }

      /* Link styles */
      .action-link {
        display: inline-block;
        padding: 10px 20px;
        background-color: #1e88e5;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        margin: 15px 0;
        transition: background-color 0.3s ease;
      }

      /* Footer styles */
      footer {
        background-color: #f8f9fa;
        padding: 20px;
        text-align: center;
        color: #666666;
        font-size: 14px;
      }

      /* Responsive design */
      @media only screen and (max-width: 600px) {
        header h1 {
          font-size: 24px;
        }

        main {
          padding: 20px 15px;
        }

        .timestamp {
          padding: 8px 15px;
          font-size: 13px;
        }
      }
    </style>
''';
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
            ${dateFormatter.format(now)} at ${timeFormatter.format(now)}
          </div>

          <main>
            <h2>Hello,</h2>
            <p>
              There has been a recent ${formatType(notice.type!.name)} that has been issued by ${formatStaffName(notice.author!)}.
            </p>
            <p>
              Please review the notification by clicking the link below:
            </p>
            <a href="${generateNoticeLink(notice)}" class="action-link">View Notification</a>
            <p>
              After reading the notification, please click "Mark as read" to acknowledge receipt.
            </p>
            <p>
              Best regards,<br>
              ADSATS Team
            </p>
          </main>

          <footer>
            <p>This is an automated message, please do not reply.</p>
          </footer>
        </div>
      </body>
    </html>
  ''';
}

String generateNoticeLink(Notice notice) {
  return 'http://127.0.0.1:8000/sms/${notice.id}';
}