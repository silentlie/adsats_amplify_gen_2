import 'dart:async';
import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
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
      ]);
      await Amplify.configure(amplifyConfig);
      safePrint('Successfully configured');
    } on Exception catch (e) {
      safePrint('Error configuring Amplify: $e');
    }
  }

  try {
    WidgetsFlutterBinding.ensureInitialized();
    await configureAmplify();
    setPathUrlStrategy();
    runApp(const MyApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    safePrint(response);

    Map<String, dynamic> jsonMap = json.decode(response.data!);
    print(jsonMap);
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        home: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const SignOutButton(),
                TextButton(
                    onPressed: () {
                      testAPI();
                    },
                    child: const Text("test API")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
