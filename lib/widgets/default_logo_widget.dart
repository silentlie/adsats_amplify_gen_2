import 'package:adsats_amplify_gen_2/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          HomeRoute().go(context);
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
          HomeRoute().go(context);
        },
        child: SvgPicture.asset(
          'assets/ADSATS_logo.svg',
          height: 40,
        ),
      ),
    );
  }
}
