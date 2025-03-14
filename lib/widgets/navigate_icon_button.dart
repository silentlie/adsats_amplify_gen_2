import 'package:flutter/material.dart';

class NavigateIconButton extends StatelessWidget {
  const NavigateIconButton({
    super.key,
    required this.icon,
    required this.name,
    this.onPressed,
  });
  final IconData icon;
  final String name;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Column(
          children: [
            Icon(
              icon,
              size: 50,
            ),
            Text(
              name,
              // style: TextStyle(fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}
