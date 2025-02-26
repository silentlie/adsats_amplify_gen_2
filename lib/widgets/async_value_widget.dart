import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.skipError = false,
    this.skipLoadingOnRefresh = true,
    this.skipLoadingOnReload = false,
  });
  // input async value
  final AsyncValue<T> value;
  // output builder function
  final Widget Function(T value) data;

  final bool skipError;

  final bool skipLoadingOnRefresh;

  final bool skipLoadingOnReload;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      skipError: skipError,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,
      error: (error, stackTrace) {
        final titleLarge = Theme.of(context).textTheme.titleLarge;
        return Center(
          child: Text(
            error.toString(),
            style: titleLarge?.copyWith(color: Colors.red),
          ),
        );
      },
    );
  }
}
