import 'package:flutter/material.dart';

mixin ConfirmDialogMixin {
  Future<bool> showConfirmDialog({
    required BuildContext context,
    required Widget title,
    required Widget content,
    String yesText = 'Yes',
    String noText = 'No',
    bool barrierDismissible = true,
  }) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: barrierDismissible,
          useRootNavigator: false,
          builder: (dialogContext) => AlertDialog(
            title: title,
            content: content,
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
