import 'package:adsats_amplify_gen_2/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
  });
  // input async value
  final AsyncValue<T> value;
  // output builder function
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () {
        return const LoadingView();
      },
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
