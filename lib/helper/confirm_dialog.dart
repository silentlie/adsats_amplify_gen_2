import 'package:flutter/material.dart';

Future<bool> showConfirmDialog(
  BuildContext context,
  Widget title,
  Widget content,
) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: title,
            content: content,
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // User pressed "No"
                  Navigator.of(context).pop(false);
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  // User pressed "Yes"
                  Navigator.of(context).pop(true);
                },
                child: Text('Yes'),
              ),
            ],
          );
        },
      ) ??
      false;
}
