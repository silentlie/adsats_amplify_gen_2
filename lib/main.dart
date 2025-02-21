import 'package:adsats_amplify_gen_2/app.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'amplify_outputs.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  setPathUrlStrategy();
  runApp(const MyApp());
}

Future<void> configureAmplify() async {
  try {
    await Amplify.addPlugins([
      AmplifyAuthCognito(),
      AmplifyAPI(
        options: APIPluginOptions(
          modelProvider: ModelProvider.instance,
          subscriptionOptions: GraphQLSubscriptionOptions(
            retryOptions: RetryOptions(maxAttempts: 10),
          )
        ),
      ),
      AmplifyStorageS3(),
    ]);
    await Amplify.configure(amplifyConfig);
    debugPrint('Successfully configured');
  } on Exception catch (e) {
    debugPrint('Error configuring Amplify: $e');
  }
}
