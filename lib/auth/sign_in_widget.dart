import 'package:adsats_amplify_gen_2/default_logo_widget.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('ADSATS')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Aviation Document Storage and Tracking System',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Container(
                  width: 550,
                  height: 150,
                  margin: const EdgeInsets.all(30),
                  child: const DefaultLogoWidget(),
                ),
              ),
              Container(
                constraints:
                    const BoxConstraints(maxWidth: 500.0, minWidth: 100),
                child: SignInForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
