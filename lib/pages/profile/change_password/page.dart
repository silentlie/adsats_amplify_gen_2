import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangePasswordPage extends StatefulHookConsumerWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String? _currentPasswordError;

  String? _validatePassword(String? value, {String? compareTo}) {
    final v = value ?? '';
    final errs = <String>[];

    if (v.isEmpty) errs.add('Please enter a password');
    if (v.length < 8) errs.add('8 character(s) minimum');
    if (!RegExp(r'[0-9]').hasMatch(v)) errs.add('Contains at least 1 number');
    if (!RegExp(r'[A-Z]').hasMatch(v)) {
      errs.add('Contains at least 1 uppercase letter');
    }
    if (!RegExp(r'[a-z]').hasMatch(v)) {
      errs.add('Contains at least 1 lowercase letter');
    }
    // Basic special chars set; extend if you allow more
    if (!RegExp(r'''[!@#\$%^&*(),.?":{}|<>_\-\[\]\\\/;'`~+=]''').hasMatch(v)) {
      errs.add('Contains at least 1 special character');
    }
    if (compareTo != null && v != compareTo) errs.add('Passwords do not match');

    return errs.isEmpty ? null : errs.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: Card(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Change Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                PasswordTextField(
                  controller: currentPasswordController,
                  labelText: "Current Password",
                  hintText: "Enter your current password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return _currentPasswordError;
                  },
                ),
                PasswordTextField(
                  controller: newPasswordController,
                  labelText: "New Password",
                  hintText: "Enter your new password",
                  validator: (value) => _validatePassword(
                    value,
                    compareTo: confirmPasswordController.text,
                  ),
                ),
                PasswordTextField(
                  controller: confirmPasswordController,
                  labelText: "Confirm New Password",
                  hintText: "Re-enter your new password",
                  validator: (value) => _validatePassword(
                    value,
                    compareTo: newPasswordController.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() => _currentPasswordError = null);
                      if (!(_formKey.currentState?.validate() ?? false)) return;
                      try {
                        await Amplify.Auth.updatePassword(
                          oldPassword: currentPasswordController.text,
                          newPassword: newPasswordController.text,
                        );
                        _formKey.currentState?.reset();
                        currentPasswordController.text = '';
                        newPasswordController.text = '';
                        confirmPasswordController.text = '';
                        if (!context.mounted) return;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content:
                                  const Text("Password changed successfully"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } on AuthException catch (e) {
                        // Surface backend error under "Current Password"
                        setState(() => _currentPasswordError = e.message);
                      }
                    },
                    child: const Text("Change Password"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final EdgeInsetsGeometry padding;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  const PasswordTextField({
    super.key,
    required this.controller,
    this.padding = const EdgeInsets.all(8.0),
    this.labelText,
    this.hintText,
    this.validator,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscure,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () => setState(() => _obscure = !_obscure),
          ),
          border: const OutlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
      ),
    );
  }
}
