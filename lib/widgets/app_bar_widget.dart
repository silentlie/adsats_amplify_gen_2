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
  late StreamController<DateTime> _timeController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timeController = StreamController<DateTime>.broadcast();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeController.isClosed) return;
      _timeController.add(DateTime.now().toUtc());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timeController.close();
    super.dispose();
  }

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          isLandscape
              ? "ADSATS - Aviation Document Storage and Tracking System"
              : "ADSATS",
          style: const TextStyle(fontSize: 16),
        ),
        StreamBuilder<DateTime>(
          stream: _timeController.stream,
          initialData: DateTime.now().toUtc(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }

            final currentTime = snapshot.data!;
            // Format: 15 MAY 2025 14:25:30 UTC
            final day = currentTime.day.toString().padLeft(2, '0');
            final month = _kMonths[currentTime.month - 1];
            final year = currentTime.year;
            final hour = currentTime.hour.toString().padLeft(2, '0');
            final minute = currentTime.minute.toString().padLeft(2, '0');
            final second = currentTime.second.toString().padLeft(2, '0');
            final timeString = '$day $month $year $hour:$minute:$second UTC';

            return Text(
              timeString,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            );
          },
        ),
      ],
    );
  }
}
