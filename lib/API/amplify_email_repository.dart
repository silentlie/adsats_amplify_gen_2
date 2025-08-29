import 'package:adsats_amplify_gen_2/API/amplify_appsync_api.dart';
import 'package:adsats_amplify_gen_2/API/mutations.dart';
import 'package:adsats_amplify_gen_2/helper/models/email_massage.dart';
import 'package:intl/intl.dart';

class AmplifyEmailRepository {
  final AmplifyAppSyncAPI _api;
  const AmplifyEmailRepository(this._api);

  Future<Map<String, dynamic>> sendEmail({
    required EmailMessage emailMessage,
    required List<String> recipients,
  }) {
    return _api.mutate(
      document: sendEmailDocument,
      variables: {
        'subject': emailMessage.subject,
        'recipients': recipients,
        'htmlBody': _buildEmailHTML(emailMessage.htmlMain),
        'author': emailMessage.sender,
      },
    );
  }

  String _buildEmailHTML(String main) {
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
        $_styles
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

  static const _styles = '''
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
}
