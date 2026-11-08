import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

/// Keep the form open when saving fails and make diagnostic details copyable.
void showSubmissionError(BuildContext context, Object error) {
  final message = 'Unable to complete the operation: $error';
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, maxLines: 6, overflow: TextOverflow.ellipsis),
      action: SnackBarAction(
        label: 'Copy details',
        onPressed: () => Clipboard.setData(ClipboardData(text: message)),
      ),
      duration: const Duration(seconds: 12),
    ),
  );
}
