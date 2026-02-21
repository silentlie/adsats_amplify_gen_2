import 'dart:async';
import 'package:adsats_amplify_gen_2/notification/notifications_widget.dart';
import 'package:adsats_amplify_gen_2/theme/theme_toggle_button.dart';
import 'package:adsats_amplify_gen_2/widgets/default_logo_widget.dart';
import 'package:flutter/material.dart';

const List<String> _kMonths = [
  'JAN',
  'FEB',
  'MAR',
  'APR',
  'MAY',
  'JUN',
  'JUL',
  'AUG',
  'SEP',
  'OCT',
  'NOV',
  'DEC'
];

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, this.isBarebone = false});

  final bool isBarebone;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: colorScheme.secondary.withValues(alpha: 0.3),
      leading: Container(
        padding: const EdgeInsets.all(2),
        child: const DefaultLogoWidget(),
      ),
      leadingWidth: 94,
      title: title(context),
      centerTitle: true,
      actions: [
        ThemeToggleButton(),
        if (!widget.isBarebone) const NotificationsWidget(),
        if (!widget.isBarebone)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          )
      ],
      primary: true,
    );
  }

  Widget title(BuildContext context) {
    final orientation = MediaQuery.orientationOf(context);
    final isLandscape = orientation == Orientation.landscape;
    final titleText = isLandscape
        ? "ADSATS - Aviation Document Storage and Tracking System"
        : "ADSATS";

    return StreamBuilder<DateTime>(
      stream: Stream<DateTime>.periodic(
        const Duration(seconds: 1),
        (_) => DateTime.now().toUtc(),
      ),
      initialData: DateTime.now().toUtc(),
      builder: (context, snapshot) {
        final currentTime = snapshot.data ?? DateTime.now().toUtc();

        final day = currentTime.day.toString().padLeft(2, '0');
        final month = _kMonths[currentTime.month - 1];
        final year = currentTime.year;
        final hour = currentTime.hour.toString().padLeft(2, '0');
        final minute = currentTime.minute.toString().padLeft(2, '0');
        final second = currentTime.second.toString().padLeft(2, '0');

        final dateString = '$day $month $year';
        final timeString = '$hour:$minute:$second UTC';

        if (isLandscape) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(dateString),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    titleText,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(timeString),
              ),
            ],
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(titleText, style: const TextStyle(fontSize: 16)),
            Text('$dateString $timeString'),
          ],
        );
      },
    );
  }
}
