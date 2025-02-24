import 'package:adsats_amplify_gen_2/widgets/loading_view.dart';
import 'package:flutter/material.dart';

class FutureValueWidget<T extends Object> extends StatelessWidget {
  const FutureValueWidget({
    super.key,
    required this.value,
    required this.data,
  });
  // input value
  final T? value;
  // output builder function
  final Widget Function(T value) data;
  @override
  Widget build(BuildContext context) {
    if (value == null) {
      return const LoadingView();
    }
    return data(value!);
  }
}
