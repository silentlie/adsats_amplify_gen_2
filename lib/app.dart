import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:adsats_amplify_gen_2/auth/auth_button_resolver.dart';
import 'package:adsats_amplify_gen_2/auth/sign_in_widget.dart';
import 'package:adsats_amplify_gen_2/settings/settings.dart';
import 'package:adsats_amplify_gen_2/theme/theme_data.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(settingsNotifierProvider.select(
      (settings) => settings.themeMode,
    ));
    return Authenticator(
      authenticatorBuilder: (context, state) {
        return switch (state.currentStep) {
          AuthenticatorStep.signIn => const SignInWidget(),
          _ => null
        };
      },
      stringResolver: AuthStringResolver(buttons: AuthButtonResolver()),
      child: MaterialApp.router(
        scaffoldMessengerKey: GlobalKey(),
        title: "ADSATS - Aviation Document Storage and Tracking System",
        builder: Authenticator.builder(),
        theme: GlobalThemeData.lightThemeData,
        darkTheme: GlobalThemeData.darkThemeData,
        themeMode: themeMode,
        debugShowMaterialGrid: false,
        routerConfig: ref.watch(routerProvider),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
