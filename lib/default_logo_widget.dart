import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DefaultTextLogo extends StatelessWidget {
  const DefaultTextLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go('/documents');
        },
        child: const Text(
          'ADSATS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class DefaultLogoWidget extends StatelessWidget {
  const DefaultLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          context.go('/documents');
        },
        child: SvgPicture.asset(
          'assets/ADSATS_logo.svg',
          height: 40,
        ),
      ),
    );
  }
}
