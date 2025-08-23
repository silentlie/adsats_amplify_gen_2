import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class AuthButtonResolver extends ButtonResolver {
  @override
  String forgotPassword(BuildContext context) {
    return "Change/Forgot Password";
  }
}
