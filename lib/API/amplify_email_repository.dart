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
    <title>ADSATS Notification</title>
    $_styles
  </head>
  <body style="margin:0; padding:0; background-color:#f0f0f0;">
    <!-- Preheader text: appears in inbox preview -->
    <div style="
      display:none;
      font-size:1px;
      line-height:1px;
      max-height:0;
      max-width:0;
      opacity:0;
      overflow:hidden;
      color:#f0f0f0;
    ">
      New ADSATS safety notice has been issued. Please review and acknowledge.
    </div>
    <!-- Full-width background -->
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f0f0f0">
      <tr>
        <td align="center" style="padding:20px 10px;">
          <!-- Fixed-width container -->
          <table width="600" border="0" cellspacing="0" cellpadding="0" style="background-color:#ffffff;">
            <!-- Header -->
            <tr>
              <td style="background-color:#0056b3; padding:20px; text-align:center;">
                <span style="font-family:Arial, sans-serif; font-size:20px; font-weight:bold; color:#ffffff;">
                  ADSATS - Aviation Document Storage and Tracking System
                </span>
              </td>
            </tr>

            <!-- Timestamp -->
            <tr>
              <td style="padding:10px 20px; background-color:#cce0f5; text-align:right;">
                <span style="font-family:Arial, sans-serif; font-size:12px; color:#333333;">
                  $formattedDate at $formattedTime<br>
                  (Timezone: $timezoneName)
                </span>
              </td>
            </tr>

            <!-- Content -->
            <tr>
              <td style="padding:20px;">
                $main
              </td>
            </tr>

            <!-- Footer -->
            <tr>
              <td style="padding:20px; border-top:1px solid #b3d7ff; text-align:center;">
                <span style="font-family:Arial, sans-serif; font-size:12px; color:#666666;">
                  This is an automated message, please do not reply.
                </span>
              </td>
            </tr>
          </table>
          <!-- /container -->
        </td>
      </tr>
    </table>
  </body>
</html>
''';
  }

  /// Very minimal, Outlook-safe CSS.
  static const _styles = '''
<style type="text/css">
  body, table, td, p, a, span {
    font-family: Arial, sans-serif;
  }

  h2 {
    font-size: 18px;
    color: #0056b3;
    margin: 0 0 10px 0;
  }

  a {
    color: #0056b3;
    text-decoration: underline;
  }
</style>
''';
}
