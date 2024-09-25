import 'package:adsats_amplify_gen_2/API/querries.dart';
import 'package:adsats_amplify_gen_2/helper/multi_select.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class FutureMultiSelect<T extends Model> extends StatelessWidget {
  const FutureMultiSelect({
    super.key,
    required this.modelType,
    required this.items,
    this.enabled = true,
    required this.onSelected,
    required this.initialSelection,
    required this.text,
    this.title,
    this.padding = const EdgeInsets.all(8.0),
  });
  final ModelType modelType;
  final List<MultiSelectItem<T>> Function(List<T> allData) items;
  final bool enabled;
  final ValueChanged<List<T>> onSelected;
  final List<T> initialSelection;
  final EdgeInsetsGeometry padding;
  final String text;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: FutureBuilder(
        future: list(modelType),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final allData = snapshot.data!.cast<T>();
            return MultiSelect<T>(
              onConfirm: onSelected,
              items: items(allData),
              initialValue: initialSelection,
              title: title,
              text: text,
              padding: padding,
            );
          } else {
            return const Placeholder();
          }
        },
      ),
    );
  }
}
