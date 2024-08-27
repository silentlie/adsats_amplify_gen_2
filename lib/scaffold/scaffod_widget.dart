import 'package:adsats_amplify_gen_2/scaffold/appbar_widget.dart';
import 'package:adsats_amplify_gen_2/scaffold/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(), endDrawer: const MyDrawer(), body: child);
  }
}