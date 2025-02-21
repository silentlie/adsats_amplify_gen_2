import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/auth/sign_in_widget.dart';
import 'package:adsats_amplify_gen_2/route/router.dart';
import 'package:adsats_amplify_gen_2/theme/theme_notifier.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(
          create: (context) {
            return ThemeNotifier();
          },
        )
      ],
      builder: (context, child) {
        return Authenticator(
          authenticatorBuilder: (context, state) {
            return switch (state.currentStep) {
              AuthenticatorStep.signIn => const SignInWidget(),
              _ => null
            };
          },
          child: MaterialApp.router(
            // TODO: add handling error messages
            scaffoldMessengerKey: GlobalKey(),
            title: "ADSATS - Aviation Document Storage and Tracking System",
            builder: Authenticator.builder(),
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: Provider.of<ThemeNotifier>(context).themeMode,
            debugShowMaterialGrid: false,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
