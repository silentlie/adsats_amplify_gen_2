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
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => AlertDialog(
        title: title,
        content: content,
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(noText),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(yesText),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
