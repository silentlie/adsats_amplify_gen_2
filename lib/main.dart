import 'dart:async';
import 'dart:convert';

import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/auth/sign_in_widget.dart';
import 'package:adsats_amplify_gen_2/route/router.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'amplify_outputs.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';

Future<void> main() async {
  Future<void> configureAmplify() async {
    try {
      await Amplify.addPlugins([
        AmplifyAuthCognito(),
        AmplifyAPI(
          options: APIPluginOptions(
            modelProvider: ModelProvider.instance,
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

  WidgetsFlutterBinding.ensureInitialized();
  await configureAmplify();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AuthNotifier();
          },
        ),
      ],
      builder: (context, child) {
        return Authenticator(
          authenticatorBuilder: (context, state) {
            switch (state.currentStep) {
              case AuthenticatorStep.signIn:
                return const SignInWidget();
              default:
                return null;
            }
          },
          child: MaterialApp.router(
            title: "ADSATS - Aviation Document Storage and Tracking System",
            builder: Authenticator.builder(),
            // theme: lightMode,
            // darkTheme: darkMode,
            // themeMode: Provider.of<ThemeNotifier>(context).themeMode,
            debugShowMaterialGrid: false,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}

Future<void> testAPI() async {
  const graphQLDocument = '''
      query ListUsers(
        \$attributesToGet: [String!],
        \$limit: Int,
        \$paginationToken: String,
        \$filter: String
      ) {
        listUsers(
          attributesToGet: \$attributesToGet,
          limit: \$limit,
          paginationToken: \$paginationToken,
          filter: \$filter
        )
      }
    ''';

  final echoRequest = GraphQLRequest<String>(
    document: graphQLDocument,
    variables: <String, dynamic>{
      "attributesToGet": null,
      "limit": null,
      "paginationToken": null,
      "filter": null,
    },
  );

  final response = await Amplify.API
      .query(
        request: echoRequest,
      )
      .response;
  // print(response);

  Map<String, dynamic> jsonMap = json.decode(response.data!);
  debugPrint(jsonMap.toString());
}
